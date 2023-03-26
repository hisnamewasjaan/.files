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

- terminal setup, font, colors etc (in dotfiles?)
- macos defaults
  - find new ones..
- [iTerm shell integration](https://iterm2.com/documentation-shell-integration.html)

## git

- conditional gitconfig can be included using [includeIf](https://git-scm.com/docs/git-config#_conditional_includes)

## iTerm2

- color presets - Pastel (Dark background)
- profile saved at [iTerm/Default.json](iTerm/Default.json)
- [Sync iTerm2 Profile With Dotfiles Repository](http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/)

## macos defaults

- [configuring_macos_big_sur_menu_bar_icons_using_dotfiles](https://sander.ginn.it/posts/configuring_macos_big_sur_menu_bar_icons_using_dotfiles/)
- [executable_dot_macos_config](https://github.com/sanderginn/dotfiles/blob/main/executable_dot_macos_config)
- [osx-for-hackers](https://www.dynamicguy.com/post/osx-for-hackers/)

## Oh My Zsh

- install powerlevel10k theme if needed

```shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Other

ZSH dotfiles load order:
.zshenv → .zprofile → .zshrc → .zlogin → .zlogout
