#!/usr/bin/env bash
# install.sh — раскладывает design-mentor в ~/.claude
#
# Агент: ~/.claude/agents/design-mentor.md
# Скилы: ~/.claude/skills/<name>/SKILL.md (плоско — так требует Claude autodiscovery)
#
# Устанавливает симлинки, чтобы `git pull` в этом репо сразу подтягивал изменения.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
AGENTS_DIR="$CLAUDE_HOME/agents"
SKILLS_DIR="$CLAUDE_HOME/skills"

echo "→ Ставлю design-mentor в $CLAUDE_HOME"

mkdir -p "$AGENTS_DIR" "$SKILLS_DIR"

# Агент
ln -sfn "$REPO_ROOT/AGENT.md" "$AGENTS_DIR/design-mentor.md"
echo "  ✓ agent: $AGENTS_DIR/design-mentor.md → $REPO_ROOT/AGENT.md"

# Скилы: обход всех SKILL.md, симлинк плоско
count=0
while IFS= read -r skill_path; do
	skill_name="$(basename "$(dirname "$skill_path")")"
	target_dir="$SKILLS_DIR/$skill_name"
	mkdir -p "$target_dir"
	ln -sfn "$skill_path" "$target_dir/SKILL.md"
	count=$((count + 1))
done < <(find "$REPO_ROOT/skills" -name SKILL.md -type f)

echo "  ✓ skills: $count скилов симлинкнуты плоско в $SKILLS_DIR/"
echo ""
echo "Готово. Позови ментора в Claude Code: 'позови ментора'"
