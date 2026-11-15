# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# Install the Homebrew packages the dotfiles depend on, then run dotbot install script
.PHONY: install
install: submodules essentials hooks ## Fetch submodules, install essential Homebrew packages, git hooks and run dotbot install script
	./install

# Check out the submodules (dotbot, ohmyzsh) at their pinned commits, also when cloned without --recurse-submodules
.PHONY: submodules
submodules: ## Check out the git submodules at their pinned commits
	git submodule update --init --recursive

# Move the submodules to the latest upstream commit; review and commit the new pointers afterwards
.PHONY: submodules-update
submodules-update: ## Update the git submodules to the latest upstream version
	git submodule update --init --remote
	git submodule status

# Run shellcheck on the shell config and macOS scripts (set-hostname.sh is zsh, which shellcheck can't parse)
.PHONY: lint
lint: ## Run shellcheck on functions/, aliases/ and macos/ scripts
	@command -v shellcheck > /dev/null || { echo "shellcheck is required, run: brew install shellcheck"; exit 1; }
	shellcheck functions/*.sh aliases/*.sh $(filter-out macos/set-hostname.sh,$(wildcard macos/*.sh))

# Use the versioned git hooks in .githooks/ (shellcheck and commit message format)
.PHONY: hooks
hooks: ## Enable the git hooks in .githooks/ for this clone
	git config core.hooksPath .githooks

# Install the Homebrew packages the dotfiles depend on (starship, delta, Nerd Font, ...)
.PHONY: essentials
essentials: ## Install essential Homebrew packages from macos/Brewfile.essentials
	@command -v brew > /dev/null || { echo "Homebrew is required, see https://brew.sh"; exit 1; }
	brew bundle install --no-upgrade --file=macos/Brewfile.essentials

# Save snapshot of all Homebrew packages to macos/Brewfile
brew: ## Save snapshot of all Homebrew packages to macos/Brewfile
	brew bundle dump -f --file=macos/Brewfile
	brew bundle cleanup --force --file=macos/Brewfile

# Restore Homebrew packages
brew-restore: ## Restore Homebrew packages
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew upgrade
	brew install mas
	brew bundle install --file=macos/Brewfile
	brew cleanup

# Uninstall all dependencies not listed from the Brewfile.
brew-bundle-cleanup: ## Uninstall all dependencies not listed from the Brewfile.
	brew bundle cleanup --file=macos/Brewfile
	brew cleanup

# Set MacOS hostname and computername
.PHONY: macos-hostname
macos-hostname: ## Set MacOS hostame, localhostname and computername
	./macos/set-hostname.sh

# Set MacOS defaults
.PHONY: macos
macos: ## Set MacOS defaults etc
	./macos/set-defaults.sh
	./macos/disable-manpage-shortcut.sh
