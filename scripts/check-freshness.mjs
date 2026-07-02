#!/usr/bin/env node
// Weekly freshness check for LIVING SKILL.md files.
// Zero deps. Node 20+.
//
// 1. Walk skills/**/SKILL.md
// 2. Keep the ones whose frontmatter says `update: living`
// 3. Extract source URLs from `sources:` list
// 4. HEAD each URL, capture Last-Modified/ETag, GET a small slice for hash
// 5. Compare against .freshness/baseline.json
// 6. Write STATUS.md + update baseline.json in place
//
// Exit code 0 always — this is a report, not a gate.

import { readFile, writeFile, readdir, mkdir } from 'node:fs/promises';
import { createHash } from 'node:crypto';
import { existsSync } from 'node:fs';
import { join, dirname, relative } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = join(__dirname, '..');
const SKILLS_DIR = join(ROOT, 'skills');
const BASELINE_PATH = join(ROOT, '.freshness', 'baseline.json');
const STATUS_PATH = join(ROOT, 'STATUS.md');

const TIMEOUT_MS = 15000;
const USER_AGENT = 'design-mentor-freshness-bot/1.0 (+https://github.com/mmkeewa/design-mentor)';

// ---- utils

async function walkSkillFiles(dir) {
  const out = [];
  for (const entry of await readdir(dir, { withFileTypes: true })) {
    const p = join(dir, entry.name);
    if (entry.isDirectory()) out.push(...(await walkSkillFiles(p)));
    else if (entry.isFile() && entry.name === 'SKILL.md') out.push(p);
  }
  return out;
}

// Minimal frontmatter parser — handles the shapes we actually use.
function parseFrontmatter(md) {
  const m = md.match(/^---\s*\n([\s\S]*?)\n---/);
  if (!m) return {};
  const body = m[1];
  const fm = {};

  // Line-level parse: `key: value` and `sources:\n  - one\n  - two`
  const lines = body.split('\n');
  let i = 0;
  while (i < lines.length) {
    const line = lines[i];
    const kv = line.match(/^([a-zA-Z_][\w-]*):\s*(.*)$/);
    if (!kv) { i++; continue; }
    const key = kv[1];
    const raw = kv[2];

    if (raw === '' || raw === '|' || raw === '>') {
      // Block scalar or list on following lines
      const items = [];
      i++;
      while (i < lines.length && (lines[i].startsWith('  ') || lines[i] === '')) {
        const listItem = lines[i].match(/^\s*-\s*(.*)$/);
        if (listItem) items.push(listItem[1].trim());
        i++;
      }
      fm[key] = items;
    } else {
      fm[key] = raw.trim();
      i++;
    }
  }
  return fm;
}

// Extract URL out of a source line like "Marty Cagan — Inspired. https://svpg.com/books/"
function extractUrl(sourceLine) {
  const m = sourceLine.match(/https?:\/\/[^\s)>\]"']+/);
  return m ? m[0].replace(/[.,;]$/, '') : null;
}

async function fetchWithTimeout(url, opts = {}) {
  const ctrl = new AbortController();
  const timer = setTimeout(() => ctrl.abort(), TIMEOUT_MS);
  try {
    const res = await fetch(url, {
      ...opts,
      signal: ctrl.signal,
      redirect: 'follow',
      headers: { 'User-Agent': USER_AGENT, ...(opts.headers || {}) },
    });
    return res;
  } finally {
    clearTimeout(timer);
  }
}

// Strip volatile HTML noise before hashing — timestamps, csrf, nonces, session ids.
function stripVolatile(html) {
  return html
    .replace(/<script[\s\S]*?<\/script>/gi, '')
    .replace(/<style[\s\S]*?<\/style>/gi, '')
    .replace(/<!--[\s\S]*?-->/g, '')
    .replace(/csrf[\w-]*[=:"'][^\s"'>]+/gi, '')
    .replace(/nonce="[^"]+"/gi, '')
    .replace(/data-[\w-]*id="[^"]+"/gi, '')
    .replace(/(\d{4}-\d{2}-\d{2}T[\d:.Z+-]+)/g, '')
    .replace(/\s+/g, ' ')
    .trim();
}

async function probeUrl(url) {
  const record = { url, status: null, last_modified: null, etag: null, hash: null, error: null };
  try {
    // HEAD first — cheapest signal
    const head = await fetchWithTimeout(url, { method: 'HEAD' });
    record.status = head.status;
    record.last_modified = head.headers.get('last-modified');
    record.etag = head.headers.get('etag');

    // GET for content hash — capped to 200KB slice to keep this cheap
    const get = await fetchWithTimeout(url);
    if (get.ok) {
      const reader = get.body.getReader();
      const chunks = [];
      let received = 0;
      const CAP = 200_000;
      while (received < CAP) {
        const { done, value } = await reader.read();
        if (done) break;
        chunks.push(value);
        received += value.length;
      }
      try { await reader.cancel(); } catch {}
      const buf = Buffer.concat(chunks.map(c => Buffer.from(c)));
      const text = stripVolatile(buf.toString('utf8'));
      record.hash = createHash('sha256').update(text).digest('hex').slice(0, 16);
    }
  } catch (e) {
    record.error = e.message || String(e);
  }
  return record;
}

// ---- main

async function main() {
  const skillFiles = await walkSkillFiles(SKILLS_DIR);
  const livingSkills = [];

  for (const path of skillFiles) {
    const md = await readFile(path, 'utf8');
    const fm = parseFrontmatter(md);
    if (fm.update !== 'living') continue;

    const sources = Array.isArray(fm.sources) ? fm.sources : [];
    const urls = sources.map(extractUrl).filter(Boolean);

    livingSkills.push({
      name: fm.name || relative(SKILLS_DIR, path).replace(/\/SKILL\.md$/, ''),
      path: relative(ROOT, path),
      urls,
    });
  }

  // Load baseline
  let baseline = { generated_at: null, skills: {} };
  if (existsSync(BASELINE_PATH)) {
    try { baseline = JSON.parse(await readFile(BASELINE_PATH, 'utf8')); } catch {}
  }

  // Probe everything
  const now = new Date().toISOString();
  const report = { generated_at: now, skills: {} };

  for (const skill of livingSkills) {
    process.stderr.write(`Checking ${skill.name} (${skill.urls.length} URLs)…\n`);
    const previous = baseline.skills[skill.name] || { sources: {} };
    const changes = [];
    const probes = {};

    for (const url of skill.urls) {
      const probe = await probeUrl(url);
      probes[url] = probe;

      const prev = previous.sources[url];
      if (prev) {
        const drift = [];
        if (probe.hash && prev.hash && probe.hash !== prev.hash) drift.push('content-hash');
        if (probe.last_modified && prev.last_modified && probe.last_modified !== prev.last_modified) drift.push('Last-Modified');
        if (probe.etag && prev.etag && probe.etag !== prev.etag) drift.push('ETag');
        if (drift.length) changes.push({ url, drift, previous_check: prev.checked_at });
      }
      probe.checked_at = now;
    }

    report.skills[skill.name] = {
      path: skill.path,
      sources: probes,
      changes,
      status: changes.length ? 'needs-review' : 'up-to-date',
    };
  }

  // Write baseline
  await mkdir(dirname(BASELINE_PATH), { recursive: true });
  await writeFile(BASELINE_PATH, JSON.stringify(report, null, 2) + '\n');

  // Write STATUS.md
  const needsReview = Object.entries(report.skills).filter(([, s]) => s.status === 'needs-review');
  const upToDate = Object.entries(report.skills).filter(([, s]) => s.status === 'up-to-date');

  let md = `# Freshness status

_Last checked: ${now.slice(0, 10)} UTC. Weekly automated check via [.github/workflows/freshness.yml](.github/workflows/freshness.yml)._

Only skills with \`update: living\` in frontmatter are checked. Books and stable references are not tracked here.

## ⚠️ Needs review (${needsReview.length})

`;

  if (needsReview.length === 0) {
    md += `_All living skills are up to date. Nothing to do._\n\n`;
  } else {
    for (const [name, s] of needsReview) {
      md += `### \`${name}\` → [${s.path}](${s.path})\n\n`;
      for (const c of s.changes) {
        md += `- **Upstream changed** (${c.drift.join(', ')}) since ${c.previous_check?.slice(0, 10) || '?'}\n`;
        md += `  <${c.url}>\n`;
      }
      md += `\n`;
    }
  }

  md += `## ✅ Up to date (${upToDate.length})\n\n`;
  for (const [name, s] of upToDate) {
    md += `- \`${name}\` → [${s.path}](${s.path})\n`;
  }

  // Errors section for transparency
  const errors = [];
  for (const [name, s] of Object.entries(report.skills)) {
    for (const [url, p] of Object.entries(s.sources)) {
      if (p.error) errors.push({ name, url, error: p.error });
    }
  }
  if (errors.length) {
    md += `\n## Fetch errors (${errors.length})\n\n`;
    md += `_These URLs could not be probed this run. Common causes: bot blocks, transient network, geo restrictions. Not treated as a change signal._\n\n`;
    for (const e of errors) md += `- \`${e.name}\` — <${e.url}> — ${e.error}\n`;
  }

  await writeFile(STATUS_PATH, md);
  process.stderr.write(`\nDone. ${needsReview.length} skill(s) need review, ${upToDate.length} up to date, ${errors.length} fetch errors.\n`);
}

main().catch(e => {
  process.stderr.write(`Fatal: ${e.stack || e.message}\n`);
  process.exit(1);
});
