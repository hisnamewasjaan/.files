# Todo

Ideas and planned improvements for these dotfiles. Done items move to the [README](README.md).

## Planned

- SSH keys and commit signing via [1Password](https://developer.1password.com/docs/ssh/)
  - done for GitHub (hisnamewasjaan), see [SSH and commit signing](README.md#ssh-and-commit-signing)
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
- [lazygit](https://github.com/jesseduffield/lazygit) - terminal UI for git


## Nice to have

- modern CLI tools
  - [zoxide](https://github.com/ajeetdsouza/zoxide) - smarter `cd` that learns your most used directories
  - [bat](https://github.com/sharkdp/bat) - `cat` with syntax highlighting
- clean-up: remove the `bash/` configs if only zsh is used
