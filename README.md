# dot files

Managed using [dotbot](https://github.com/anishathalye/dotbot)

Keeps ohmyzsh as a git submodule.

## Installation

clone into `~/.dotfiles` with `--recurse-submodules` flag
```
git clone --recurse-submodules git@github.com:hisnamewasjaan/.files.git ~/.dotfiles
```

or get ohmyzsh submodule afterwards
```
git clone git@github.com:hisnamewasjaan/.files.git ~/.dotfiles
git submodule init
git submodule update
```

Adjust [zshrc](zsh/zshrc) to your liking. Theme, plugins etc


```
./install
```

## Usage

Edit [install.conf.yaml](install.conf.yaml) as needed

Check [dotbot](https://github.com/anishathalye/dotbot) for more info

## Other
run
```shell
make
```
to see other option

## Todo

- [iTerm shell integration](https://iterm2.com/documentation-shell-integration.html)
- [awesome-command-line-apps](https://git.herrbischoff.com/awesome-command-line-apps/about/)
- SSH keys and commit signing via [1Password](https://developer.1password.com/docs/ssh/)
  - replace the RSA keys (`id_rsa`, `hisnamewasjaan_id_rsa`) with an Ed25519 key stored in 1Password
  - use the 1Password SSH agent in `~/.ssh/config`, so no private key files are kept on disk
  - sign commits with `gpg.format = ssh` and `commit.gpgsign = true` in [gitconfig](git/gitconfig)
  - alternative without 1Password: a macOS-native SSH key in the Secure Enclave
    - non-exportable key, Touch ID on each use, one key per Mac (no iCloud sync - add each Mac's key to GitHub)
    - create with `sc_auth create-ctk-identity -l ssh -k p-256-ne -t bio`, then `ssh-keygen -w /usr/lib/ssh-keychain.dylib -K -N ""`
    - use `SecurityKeyProvider /usr/lib/ssh-keychain.dylib` in `~/.ssh/config`, and the same key for commit signing
- [fzf](https://github.com/junegunn/fzf) - fuzzy history search (`Ctrl+R`) and file picker (`Ctrl+T`), via the oh-my-zsh `fzf` plugin
- zsh plugins
  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - suggest commands from history as you type
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - highlight commands as you type, so typos show before running
- [mise](https://mise.jdx.dev/) - one version manager for Java, Node and Python, replacing SDKMAN and Homebrew `openjdk`/`node`, pinned per project in `.mise.toml`

### Nice to have

- modern CLI tools
  - [zoxide](https://github.com/ajeetdsouza/zoxide) - smarter `cd` that learns your most used directories
  - [bat](https://github.com/sharkdp/bat) - `cat` with syntax highlighting
  - [eza](https://github.com/eza-community/eza) - modern `ls`
  - [fd](https://github.com/sharkdp/fd) - simpler, faster `find`
  - [direnv](https://direnv.net/) - per-directory environment variables
  - [lazygit](https://github.com/jesseduffield/lazygit) - terminal UI for git
- repo checks: a `make lint` target running [shellcheck](https://www.shellcheck.net/) on `functions/`, `aliases/` and `macos/` scripts, plus a pre-commit hook for shellcheck and commit message format
- clean-up: remove the `bash/` configs if only zsh is used

## git

- conditional gitconfig can be included using [includeIf](https://git-scm.com/docs/git-config#_conditional_includes)

## iTerm2

- color presets - Pastel (Dark background)
- preferences saved at [iTerm/com.googlecode.iterm2.plist](iTerm/com.googlecode.iterm2.plist), linked to `~/.iterm/` by [install.conf.yaml](install.conf.yaml)
- exported profile at [iTerm/Default.json](iTerm/Default.json)
- [Sync iTerm2 Profile With Dotfiles Repository](http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/)

## macos defaults and cli tools

- [configuring_macos_big_sur_menu_bar_icons_using_dotfiles](https://sander.ginn.it/posts/configuring_macos_big_sur_menu_bar_icons_using_dotfiles/)
- [executable_dot_macos_config](https://github.com/sanderginn/dotfiles/blob/main/executable_dot_macos_config)
- [osx-for-hackers](https://www.dynamicguy.com/post/osx-for-hackers/)
- [https://macos-defaults.com/](https://macos-defaults.com/)
- [awesome-macos-command-line](https://git.herrbischoff.com/awesome-macos-command-line/about/)
- [learn-anything/command-line-tools](https://github.com/learn-anything/command-line-tools)
- [An A-Z Index of the Apple macOS command line (macOS bash)](https://ss64.com/mac/)

## Oh My Zsh

- update the submodule to the latest upstream version

```shell
git submodule update --remote zsh/ohmyzsh
```

## Prompt

- [Starship](https://starship.rs/), installed via the [Brewfile](macos/Brewfile) and initialized in [zshrc](zsh/zshrc)
- config in [starship/starship.toml](starship/starship.toml), based on the [nerd-font-symbols](https://starship.rs/presets/nerd-font-symbols) preset, linked to `~/.config/starship.toml`
- requires a [Nerd Font](https://www.nerdfonts.com/) in the terminal

## Manual settings
System preferences

- Disable 'Close windows when quitting an application'

## Zsh load order

`.zshenv` → `.zprofile` → `.zshrc` → `.zlogin` → `.zlogout`
