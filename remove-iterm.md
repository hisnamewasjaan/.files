# Remove iTerm2

Checklist for dropping iTerm2 in favour of [Ghostty](ghostty/config.ghostty).
Use Ghostty day to day for a while first, so anything missing from iTerm shows up before its config is gone.

## Repository

- [ ] delete the [iTerm/](iTerm/) folder (`com.googlecode.iterm2.plist` and `Default.json`)
- [ ] [macos/set-defaults.sh](macos/set-defaults.sh): remove the iTerm2 block (`PrefsCustomFolder`, `LoadPrefsFromCustomFolder`, `PromptOnQuit`)
- [ ] [macos/Brewfile](macos/Brewfile): remove `cask "iterm2"`
- [ ] [macos/Brewfile.essentials](macos/Brewfile.essentials): keep or drop `font-jetbrains-mono-nerd-font`
  - Ghostty bundles JetBrains Mono with the Nerd Font symbols, so starship no longer needs it
  - keep it if other apps (IDE, editors) use it; either way, update the comment that says "used by iTerm2"
- [ ] [zsh/zshenv](zsh/zshenv): reword the comment about `LANG` being unset "in iTerm" (it applies to any macOS terminal)
- [ ] [AGENTS.md](AGENTS.md): remove the `iTerm/` row in the table and the "Editing `iTerm/com.googlecode.iterm2.plist`" item under *Ask before doing*
- [ ] [README.md](README.md)
  - remove the *iTerm2* section
  - remove the *iTerm shell integration* todo (Ghostty has shell integration built in)
  - *Prompt*: change "used by iTerm2" for the Nerd Font
  - *Claude Code*: the reason `~/.claude/settings.json` is not managed is iTerm2's Claude Code integration; reconsider managing it here
  - add a short *Ghostty* section: config in `ghostty/config.ghostty`, follows the macOS light/dark appearance, `ghostty +list-themes` and `ghostty +validate-config`

## Each Mac

- [ ] `brew uninstall --cask iterm2`, on the Workbrew-enrolled Mac check first whether iTerm2 is managed by Workbrew
- [ ] optionally clear iTerm2's settings: `defaults delete com.googlecode.iterm2`
- [ ] set Ghostty as the default terminal where apps ask for one (e.g. Raycast, JetBrains IDEs)
