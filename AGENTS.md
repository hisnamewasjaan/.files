# Agent instructions

Personal macOS dotfiles, shared between a personal Mac and a work Mac enrolled in Workbrew.
The repository is public: never commit secrets, tokens, or machine-specific private data.

## How it works

- [dotbot](https://github.com/anishathalye/dotbot) symlinks files into `$HOME`, configured in `install.conf.yaml`.
- `make install` installs the Homebrew packages the dotfiles depend on (`macos/Brewfile.essentials`), then runs `./install`.
- Submodules: `dotbot` and `zsh/ohmyzsh` (oh-my-zsh, plugins `vi-mode` and `dotenv` only).
- The prompt is [starship](https://starship.rs/) (`starship/starship.toml`, nerd-font-symbols preset).
- `claude/` holds the global Claude Code instructions and status line, linked into `~/.claude/`.

| Path                                      | Purpose                                                                                              |
|-------------------------------------------|------------------------------------------------------------------------------------------------------|
| `zsh/zshenv`, `zsh/zprofile`, `zsh/zshrc` | Shell setup: PATH and locale, login setup, interactive setup                                         |
| `aliases/*.aliases.sh`, `functions/*.sh`  | Sourced by `zshrc` in that order: functions first, then aliases                                      |
| `git/`                                    | Global git config, ignore and attributes; `gitconfig-nine` holds the work identity for `~/dev/erst/` |
| `macos/`                                  | Brewfiles and one-off macOS setup scripts                                                            |
| `ssh/`                                    | Public keys only (GitHub key, allowed_signers); `~/.ssh/config` stays out, it lists work hosts       |

## Conventions

- Shell config targets **zsh**, even though some files carry a bash shebang. Match the surrounding style
  (comment above each alias/function, tabs in `functions.sh`).
- Commits follow Conventional Commits, e.g. `fix(zsh): …`, `feat(git): …`, `chore(brew): …`.
- Keep `zshrc` lean: no oh-my-zsh template boilerplate, no commented-out examples.
- Tools that the config hard-depends on (delta, starship, git-extras, the Nerd Font) must be listed in
  `macos/Brewfile.essentials`.

## Verifying changes

- Syntax: `zsh -n <file>` for zsh files, `sh -n`/`bash -n` for scripts.
- Behaviour: test in a fresh login shell, e.g. `zsh -lic '<command>'`; use `script -q /dev/null zsh -lic …`
  when a real terminal is needed (prompt, vi-mode).
- Links: `./install --dry-run` before `./install`.
- Note that `diff`, `g`, `rg`, `ls` and others are aliases or functions in interactive shells; use
  `command <name>` in tests.

## Ask before doing

- Running `macos/*.sh` or `make macos`: they change system settings.
- Running `make brew`, `make brew-restore` or `make brew-bundle-cleanup`: they rewrite the Brewfile or
  install/uninstall packages, and must never run on the Workbrew-enrolled Mac.
- Anything that sends data elsewhere, e.g. `git push` (the repository is public).

## dotfiles inspiration

- https://www.prskavec.net/post/my-dotfiles-and-the-tools-i-use/
