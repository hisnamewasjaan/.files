# Fresh Mac

Ordered checklist for a brand new Mac. Details live in the [README](README.md); this file only fixes the order.

The shell config expects the repository at `~/.dotfiles`.

## 1. Prerequisites

1. Command Line Tools, which provide `git` and `make`:

   ```shell
   xcode-select --install
   ```

2. [Homebrew](https://brew.sh). Skip on the Workbrew Mac, Workbrew provides `brew`.

## 2. Clone and link

Clone over HTTPS: the SSH key lives in 1Password, which is not set up yet.

```shell
git clone https://github.com/hisnamewasjaan/.files.git ~/.dotfiles
cd ~/.dotfiles
make install
```

Optionally switch the remote to SSH once step 3 is done:
`git remote set-url origin git@github.com:hisnamewasjaan/.files.git`

Then [SDKMAN](https://sdkman.io)

```shell
curl -s "https://get.sdkman.io" | bash
```

## 3. SSH and commit signing

Follow [Setting up another Mac](README.md#setting-up-another-mac): 1Password SSH agent, then the `Host github.com`
block in `~/.ssh/config`. Rerun `make install` afterwards, so the signing config gets linked.

## 4. macOS settings

Ask before running these on a managed Mac: they change system settings.

```shell
make macos-hostname
make macos
```

> List anything that cannot be scripted here.

Log out and back in, so the keyboard and Dock settings apply everywhere.

## 5. Apps and tools

- Personal Mac: `make brew-restore` installs the full [Brewfile](macos/Brewfile).
- Work Mac (Workbrew): never run `make brew-restore`. Install what the shell config uses by hand:
  `ripgrep` (`rg` aliases), `node` (`update` alias), `gh` and `docker-desktop` and `docker/tap/sbx` (sbx functions).

## 6. Check

```shell
zsh -lic 'echo $DOTFILES'                # /Users/<you>/.dotfiles
ssh -T git@github.com                    # Hi hisnamewasjaan! ...
git config --get commit.gpgsign          # true
sdk version
```
