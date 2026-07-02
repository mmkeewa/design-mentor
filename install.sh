#!/usr/bin/env bash
# install.sh — раскладывает design-mentor в ~/.claude через симлинки.
#
# Агент: ~/.claude/agents/design-mentor.md
# Скилы: ~/.claude/skills/<name>/SKILL.md  (плоско — так требует Claude autodiscovery)
#
# Симлинки, а не копии: `git pull` в этом репо сразу подтягивает свежий контент.
#
# Usage:
#   ./install.sh              стандартная установка
#   ./install.sh --check      показать текущее состояние (ничего не менять)
#   ./install.sh --dry-run    показать, что будет сделано, без изменений
#   ./install.sh --force      перезаписать чужие файлы с тем же именем
#   ./install.sh --uninstall  удалить все наши симлинки
#   ./install.sh --update     git pull + переустановка
#   ./install.sh --help       эта справка

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
AGENTS_DIR="$CLAUDE_HOME/agents"
SKILLS_DIR="$CLAUDE_HOME/skills"
AGENT_LINK="$AGENTS_DIR/design-mentor.md"

# --- ANSI colors (skip on non-TTY)
if [[ -t 1 ]]; then
	c_bold=$'\033[1m'; c_dim=$'\033[2m'; c_ok=$'\033[32m'; c_warn=$'\033[33m'
	c_err=$'\033[31m'; c_info=$'\033[36m'; c_reset=$'\033[0m'
else
	c_bold=''; c_dim=''; c_ok=''; c_warn=''; c_err=''; c_info=''; c_reset=''
fi

# --- flags
MODE=install
DRY_RUN=false
FORCE=false

while [[ $# -gt 0 ]]; do
	case "$1" in
		--check)     MODE=check;     shift ;;
		--dry-run)   DRY_RUN=true;   shift ;;
		--force)     FORCE=true;     shift ;;
		--uninstall) MODE=uninstall; shift ;;
		--update)    MODE=update;    shift ;;
		--help|-h)   MODE=help;      shift ;;
		*) echo "${c_err}Unknown flag: $1${c_reset}"; echo "Use --help for usage."; exit 2 ;;
	esac
done

# --- helpers

log_info()  { printf "%s→ %s%s\n" "$c_info" "$1" "$c_reset"; }
log_ok()    { printf "  %s✓%s %s\n" "$c_ok" "$c_reset" "$1"; }
log_warn()  { printf "  %s⚠%s %s\n" "$c_warn" "$c_reset" "$1"; }
log_err()   { printf "  %s✗%s %s\n" "$c_err" "$c_reset" "$1"; }
log_skip()  { printf "  %s—%s %s\n" "$c_dim" "$c_reset" "$1"; }

run() {
	if $DRY_RUN; then
		printf "  %s[dry-run]%s %s\n" "$c_dim" "$c_reset" "$*"
	else
		"$@"
	fi
}

git_commit() {
	git -C "$REPO_ROOT" rev-parse --short HEAD 2>/dev/null || echo "?"
}

# Returns 0 if $1 is a symlink pointing into REPO_ROOT
is_ours() {
	local link="$1"
	[[ -L "$link" ]] || return 1
	local target
	target="$(readlink "$link")"
	[[ "$target" == "$REPO_ROOT"* ]]
}

# List all our skill link locations by walking the repo
enumerate_skills() {
	find "$REPO_ROOT/skills" -name SKILL.md -type f | while IFS= read -r src; do
		local name
		name="$(basename "$(dirname "$src")")"
		printf "%s\t%s\n" "$name" "$src"
	done
}

# --- commands

cmd_help() {
	# Print the top comment block (skip the shebang, stop at first non-comment).
	awk 'NR==1{next} /^[^#]/{exit} {sub(/^# ?/,""); print}' "$0"
}

cmd_check() {
	log_info "Статус design-mentor (repo commit $(git_commit))"
	echo ""

	# Agent
	if [[ -L "$AGENT_LINK" ]] && is_ours "$AGENT_LINK"; then
		local tgt; tgt="$(readlink "$AGENT_LINK")"
		if [[ "$tgt" == "$REPO_ROOT/AGENT.md" ]]; then
			log_ok "agent: $AGENT_LINK ← $tgt"
		else
			log_warn "agent: $AGENT_LINK симлинк на неожиданный путь ($tgt)"
		fi
	elif [[ -e "$AGENT_LINK" ]]; then
		log_err "agent: $AGENT_LINK существует, но это не наш симлинк"
	else
		log_skip "agent: не установлен"
	fi

	# Skills
	local ours=0 missing=0 foreign=0
	while IFS=$'\t' read -r name src; do
		local link="$SKILLS_DIR/$name/SKILL.md"
		if [[ -L "$link" ]] && is_ours "$link"; then
			ours=$((ours + 1))
		elif [[ -e "$link" ]]; then
			log_err "skill: $link — существует, но не наш файл"
			foreign=$((foreign + 1))
		else
			missing=$((missing + 1))
		fi
	done < <(enumerate_skills)

	local total=$((ours + missing + foreign))
	echo ""
	log_info "Скилы: $ours из $total установлены, $missing не установлены, $foreign чужих"
}

cmd_install() {
	log_info "Ставлю design-mentor в $CLAUDE_HOME (repo commit $(git_commit))"
	$DRY_RUN && log_info "Режим: dry-run (ничего реально не меняется)"
	echo ""

	run mkdir -p "$AGENTS_DIR" "$SKILLS_DIR"

	# Agent
	if [[ -e "$AGENT_LINK" ]] && ! is_ours "$AGENT_LINK"; then
		if $FORCE; then
			log_warn "agent: перезаписываю чужой файл $AGENT_LINK"
			run rm -f "$AGENT_LINK"
		else
			log_err "agent: $AGENT_LINK уже существует и не наш. Используй --force для перезаписи."
			exit 1
		fi
	fi
	run ln -sfn "$REPO_ROOT/AGENT.md" "$AGENT_LINK"
	log_ok "agent: $AGENT_LINK"

	# Skills
	local installed=0 skipped=0 replaced=0
	while IFS=$'\t' read -r name src; do
		local target_dir="$SKILLS_DIR/$name"
		local link="$target_dir/SKILL.md"

		if [[ -e "$link" ]] && ! is_ours "$link"; then
			if $FORCE; then
				log_warn "skill $name: перезаписываю чужой файл"
				run rm -f "$link"
				replaced=$((replaced + 1))
			else
				log_err "skill $name: $link существует и не наш. Пропускаю. Используй --force для перезаписи."
				skipped=$((skipped + 1))
				continue
			fi
		fi

		run mkdir -p "$target_dir"
		run ln -sfn "$src" "$link"
		installed=$((installed + 1))
	done < <(enumerate_skills)

	echo ""
	log_ok "Установлено: $installed скил(ов)"
	[[ $replaced -gt 0 ]] && log_warn "Перезаписано чужих: $replaced"
	[[ $skipped  -gt 0 ]] && log_warn "Пропущено (конфликт): $skipped"

	if ! $DRY_RUN; then
		echo ""
		log_info "Готово. В Claude Code вызови: 'позови ментора'"
	fi
}

cmd_uninstall() {
	log_info "Удаляю design-mentor из $CLAUDE_HOME"
	$DRY_RUN && log_info "Режим: dry-run"
	echo ""

	# Agent
	if [[ -L "$AGENT_LINK" ]] && is_ours "$AGENT_LINK"; then
		run rm -f "$AGENT_LINK"
		log_ok "agent удалён"
	elif [[ -e "$AGENT_LINK" ]]; then
		log_warn "agent: $AGENT_LINK не наш — не трогаю"
	else
		log_skip "agent: не установлен"
	fi

	# Skills
	local removed=0
	while IFS=$'\t' read -r name src; do
		local target_dir="$SKILLS_DIR/$name"
		local link="$target_dir/SKILL.md"

		if [[ -L "$link" ]] && is_ours "$link"; then
			run rm -f "$link"
			removed=$((removed + 1))
			# Remove empty parent dir
			if [[ -d "$target_dir" ]] && [[ -z "$(ls -A "$target_dir" 2>/dev/null)" ]]; then
				run rmdir "$target_dir"
			fi
		fi
	done < <(enumerate_skills)

	echo ""
	log_ok "Удалено: $removed скил(ов)"
	log_info "Файлы в $REPO_ROOT не тронуты."
}

cmd_update() {
	log_info "git pull + переустановка"
	echo ""

	if $DRY_RUN; then
		log_info "[dry-run] git pull --ff-only --rebase=false"
	else
		if ! git -C "$REPO_ROOT" pull --ff-only --rebase=false; then
			log_err "git pull не прошёл (не fast-forward или репо dirty). Разберись руками."
			exit 1
		fi
	fi
	echo ""
	cmd_install
}

# --- main

case "$MODE" in
	install)   cmd_install ;;
	check)     cmd_check ;;
	uninstall) cmd_uninstall ;;
	update)    cmd_update ;;
	help)      cmd_help ;;
esac
