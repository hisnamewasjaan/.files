#!/bin/bash
# Claude Code status line in the style of the starship shell prompt.
#
# Directory and git segments are rendered by starship itself, so they follow
# starship/starship.toml exactly. Claude Code session details are appended in the
# same style: named colors, starship-like "via" wording, and Nerd Font icons.
#
# Claude Code passes session details as JSON on stdin:
# https://docs.claude.com/en/docs/claude-code/statusline

input=$(cat)

field() { jq -r "$1 // empty" <<< "$input"; }

cwd=$(field '.workspace.current_dir // .cwd')
model=$(field '.model.display_name')
style=$(field '.output_style.name')
context_left=$(field '.context_window.remaining_percentage')
five_hour=$(field '.rate_limits.five_hour.used_percentage')
seven_day=$(field '.rate_limits.seven_day.used_percentage')
vim_mode=$(field '.vim.mode')
worktree=$(field '.worktree.name')
pr_number=$(field '.pr.number')
pr_state=$(field '.pr.review_state')

[ -z "$cwd" ] && cwd="$PWD"

# Print text in an ANSI style, e.g. `paint "1;32" text` for bold green
paint() { printf '\033[%sm%s\033[0m' "$1" "$2"; }

# Green when plenty is left, yellow when getting low, red when nearly used up
level() {
	local left=${1%%.*}
	if ((left < 20)); then echo "1;31"; elif ((left < 50)); then echo "1;33"; else echo "1;32"; fi
}

# ---- Directory and git, rendered by starship ----------------------------------
# GIT_OPTIONAL_LOCKS=0 keeps git from taking locks that could clash with git
# commands Claude (or the user) runs at the same time.
line=$(cd "$cwd" 2> /dev/null && for module in directory git_branch git_status; do
	GIT_OPTIONAL_LOCKS=0 STARSHIP_SHELL= starship module "$module"
done)

# ---- Claude Code session --------------------------------------------------------
if [ -n "$model" ]; then
	line+="via $(paint "1;35" "󰚩 ${model}")"
	[ -n "$style" ] && [ "$style" != "default" ] && line+=" $(paint "35" "(${style})")"
	line+=" "
fi

[ -n "$context_left" ] && line+="$(paint "$(level "$context_left")" "ctx ${context_left%%.*}%") "

for limit in "5h:${five_hour}" "7d:${seven_day}"; do
	used=${limit#*:}
	[ -z "$used" ] && continue
	used=$(printf '%.0f' "$used")
	line+="$(paint "$(level $((100 - used)))" "${limit%%:*} ${used}%") "
done

[ -n "$vim_mode" ] && line+="$(paint "1;32" "[${vim_mode}]") "
[ -n "$worktree" ] && line+="in $(paint "1;33" " ${worktree}") "

if [ -n "$pr_number" ]; then
	case "$pr_state" in
		approved) pr_style="1;32" ;;
		changes_requested) pr_style="1;31" ;;
		pending) pr_style="1;33" ;;
		*) pr_style="1;37" ;;
	esac
	line+="$(paint "$pr_style" " #${pr_number}") "
fi

printf '%s\n' "${line% }"
