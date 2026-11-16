# dot files

Managed using [dotbot](https://github.com/anishathalye/dotbot)

Keeps two git submodules:

- [dotbot/](dotbot) - [dotbot](https://github.com/anishathalye/dotbot), runs the linking
- [zsh/ohmyzsh/](zsh/ohmyzsh) - [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)

## Installation

Requires [Homebrew](https://brew.sh).

`git clone` and `make install`:

```
git clone git@github.com:hisnamewasjaan/.files.git ~/.dotfiles
cd ~/.dotfiles
make install
```

### `make install` runs these steps in order:

1. `make submodules`: checks out the submodules (dotbot, oh-my-zsh), so `--recurse-submodules` is not needed.
2. `make essentials`: installs the Homebrew packages the dotfiles depend on ([macos/Brewfile.essentials](macos/Brewfile.essentials)).
3. `make hooks`: enables the git hooks in [.githooks](.githooks): shellcheck on staged shell scripts, and a Conventional Commits check on the commit message.
4. `./install`: links the dotfiles into `$HOME` with dotbot.

Run it again after pulling changes.

For GitHub login and commit signing, also follow [Setting up another Mac](#setting-up-another-mac).

## Usage

- full set of apps and tools can be restored separately with `make brew-restore`.
- adjust [zshrc](zsh/zshrc) to your liking: theme, plugins etc
- edit [install.conf.yaml](install.conf.yaml) to change which files are linked, see [dotbot](https://github.com/anishathalye/dotbot) for the format
- run `make lint` to shellcheck `functions/`, `aliases/` and `macos/` by hand
- run `make` to see all other options

## Todo

See [TODO.md](TODO.md).

## git

- conditional gitconfig can be included using [includeIf](https://git-scm.com/docs/git-config#_conditional_includes)

## SSH and commit signing

GitHub (account `hisnamewasjaan`) uses an Ed25519 SSH key stored in 1Password, for both login and commit
signing. The private key never leaves 1Password, and syncs to every Mac signed in to the same 1Password account.

`make install` links the public parts from this repo:

- [ssh/github-hisnamewasjaan.pub](ssh/github-hisnamewasjaan.pub) to `~/.ssh/github-hisnamewasjaan.pub`
- [ssh/allowed_signers](ssh/allowed_signers) to `~/.ssh/allowed_signers`, to verify signatures locally
- [git/gitconfig-signing](git/gitconfig-signing) to `~/.gitconfig-signing`, **only** when the 1Password SSH agent
  holds the key. Elsewhere the link is skipped, and commits are made unsigned instead of failing.

Work repos in `~/dev/erst/` are not signed ([git/gitconfig-nine](git/gitconfig-nine)).

### Setting up another Mac

1. In 1Password, enable *Settings → Developer → Use the SSH agent*, and make sure the
   *Github (hisnamewasjaan)* key is in the Personal vault.
2. Add this block to `~/.ssh/config`. The file is not in this repo, as it lists work hosts.

   ```
   # GitHub only for now, other hosts keep their key files
   Host github.com
   	IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
   	# Public key of the hisnamewasjaan account key in 1Password, so only that key is offered
   	IdentityFile ~/.ssh/github-hisnamewasjaan.pub
   	IdentitiesOnly yes
   ```

   If 1Password offers to edit the file automatically, it adds `Host *` instead, which sends the key to every server.
3. Run `make install`, or rerun it if it ran before step 1.
4. Check that it works:

   ```shell
   ssh -T git@github.com                    # Hi hisnamewasjaan! ...
   git config --get commit.gpgsign          # true
   git log -1 --show-signature              # Good "git" signature ... (on a new commit)
   ```

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

- update the submodules (ohmyzsh and dotbot) to the latest upstream version, then commit the new submodule commits

```shell
make submodules-update
```

## Prompt

- [Starship](https://starship.rs/), installed by `make install` via [macos/Brewfile.essentials](macos/Brewfile.essentials) and initialized in [zshrc](zsh/zshrc)
- config in [starship/starship.toml](starship/starship.toml), based on the [nerd-font-symbols](https://starship.rs/presets/nerd-font-symbols) preset, linked to `~/.config/starship.toml`
- requires a [Nerd Font](https://www.nerdfonts.com/) in the terminal - JetBrains Mono Nerd Font is installed via [macos/Brewfile.essentials](macos/Brewfile.essentials) and used by iTerm2

## Claude Code and other AI tools

- [AGENTS.md](AGENTS.md) describes this repo for AI coding tools; [CLAUDE.md](CLAUDE.md) imports it for Claude Code
- global Claude Code instructions and status line in [claude/](claude/), linked to `~/.claude/` by [install.conf.yaml](install.conf.yaml)
- `~/.claude/settings.json` is not managed here, as iTerm2's Claude Code integration writes hooks with absolute paths into it

## Manual settings
System preferences

- Disable 'Close windows when quitting an application'

## Zsh load order

`.zshenv` → `.zprofile` → `.zshrc` → `.zlogin` → `.zlogout`
