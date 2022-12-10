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

## Contributing

## History

## Credits

## Licence

## Todo

- terminal setup, font, colors etc (in dotfiles?)
- macos defaults
  - find new ones..

## git

- conditional gitconfig can be included using [includeIf](https://git-scm.com/docs/git-config#_conditional_includes)

## iTerm2

- color presets - Pastel (Dark background)
- profile saved at iTerm/Default.json

## Other

ZSH dotfiles load order:
.zshenv → .zprofile → .zshrc → .zlogin → .zlogout
