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


Requires [Homebrew](https://brew.sh). Installs the packages the dotfiles depend on ([macos/Brewfile.essentials](macos/Brewfile.essentials)) and links the dotfiles with dotbot.
Run it again after pulling changes.

```
make install
```

The full set of apps and tools is restored separately with `make brew-restore`.

`make install` also enables the git hooks in [.githooks](.githooks) (`make hooks`): shellcheck on staged shell scripts, and a Conventional Commits check on the commit message.
Run `make lint` to shellcheck `functions/`, `aliases/` and `macos/` by hand.

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

- SSH keys and commit signing via [1Password](https://developer.1password.com/docs/ssh/)
  - done for GitHub (hisnamewasjaan): Ed25519 key in 1Password, used for login and commit signing,
    set up per machine in `~/.ssh/config` and `~/.gitconfig.local` (not in this repo)
  - remove the old RSA key `jbe@nineconsult.dk` from GitHub once nothing uses it
  - other GitHub accounts: one key each in 1Password, with a `Host github-<account>` alias in `~/.ssh/config`
  - Hetzner and work servers: move to 1Password keys, using `IdentitiesOnly yes` per host
  - alternative without 1Password, e.g. on the work Mac: a macOS-native SSH key in the Secure Enclave
    - non-exportable key, Touch ID on each use, one key per Mac
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
- clean-up: remove the `bash/` configs if only zsh is used

## git

- conditional gitconfig can be included using [includeIf](https://git-scm.com/docs/git-config#_conditional_includes)

## iTerm2

- color presets - Pastel (Dark background)
- preferences loaded from and saved to [iTerm/](iTerm/) directly, set up by [macos/set-defaults.sh](macos/set-defaults.sh)
- changes are only written back to the repo when saved: search iTerm's settings for *custom folder*, then set *Save changes* to *Automatically* or click *Save Now*
- exported profile at [iTerm/Default.json](iTerm/Default.json)
- [Sync iTerm2 Profile With Dotfiles Repository](http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/)

## macos defaults and cli tools

- [configuring_macos_big_sur_menu_bar_icons_using_dotfiles](https://sander.ginn.it/posts/configuring_macos_big_sur_menu_bar_icons_using_dotfiles/)
- [executable_dot_macos_config](https://github.com/sanderginn/dotfiles/blob/main/executable_dot_macos_config)
- [osx-for-hackers](https://www.dynamicguy.com/post/osx-for-hackers/)
- [https://macos-defaults.com/](https://macos-defaults.com/)
- [awesome-macos-command-line](https://git.herrbischoff.com/awesome-macos-command-line/about/)
- [awesome-command-line-apps](https://git.herrbischoff.com/awesome-command-line-apps/about/)
- [eza](https://github.com/eza-community/eza) - modern `ls`
- [fd](https://github.com/sharkdp/fd) - simpler, faster `find`
- [lazygit](https://github.com/jesseduffield/lazygit) - terminal UI for git
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
- requires a [Nerd Font](https://www.nerdfonts.com/) in the terminal - JetBrains Mono Nerd Font is installed via the Brewfile and used by iTerm2

## Claude Code and other AI tools

- [AGENTS.md](AGENTS.md) describes this repo for AI coding tools; [CLAUDE.md](CLAUDE.md) imports it for Claude Code
- global Claude Code instructions and status line in [claude/](claude/), linked to `~/.claude/` by [install.conf.yaml](install.conf.yaml)
- `~/.claude/settings.json` is not managed here, as iTerm2's Claude Code integration writes hooks with absolute paths into it

## Manual settings
System preferences

- Disable 'Close windows when quitting an application'

## Zsh load order

`.zshenv` → `.zprofile` → `.zshrc` → `.zlogin` → `.zlogout`
