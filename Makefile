# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# Install the Homebrew packages the dotfiles depend on, then run dotbot install script
.PHONY: install
install: essentials ## Install essential Homebrew packages and run dotbot install script
	./install

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
