# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# Run dotbot install script
.PHONY: install
install: ## Run dotbot install script
	./install

# Save snapshot of all Homebrew packages to macos/Brewfile
brew: ## Save snapshot of all Homebrew packages to macos/Brewfile
	brew bundle dump -f --describe --file=macos/Brewfile
	brew bundle --force cleanup --file=macos/Brewfile

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
