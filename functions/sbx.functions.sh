#!/usr/bin/env bash

# one-time: store the gh token as a custom sbx secret; the sandbox only sees a placeholder
function sbxsetup() {
	if sbx secret ls | grep -q 'GH_TOKEN'; then
		echo "GH_TOKEN secret already set; remove it first to recreate"
		return 0
	fi
	sbx secret set-custom \
		--host github.com \
		--host '*.github.com' \
		--host '*.business.githubcopilot.com' \
		--host api.githubcopilot.com \
		--host raw.githubusercontent.com \
		--env GH_TOKEN \
		--placeholder 'gho_{rand}' \
		--command "$(command -v gh) auth token"
}

# run copilot in a docker sandbox for the current dir (or the given dirs); re-attaches if it exists
# usage: sbxcopilot [workspace...] [-- copilot args]
function sbxcopilot() {
	sbx run copilot "$@"
}

# run copilot in a throwaway sandbox that is removed on exit
function sbxcopilotrm() {
	sbx run copilot --rm "$@"
}
