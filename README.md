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

Edit install.conf.yaml as needed

## Contributing

## History

## Credits

## Licence

## Todo

- manage different git settings based on folder
  - using dotenv for this
- git settings in general
- terminal setup, font, colors etc (in dotfiles?)
- macos defaults
  - find new ones..

## iTerm2

- color presets - Pastel (Dark background)
- profile saved at iTerm/Default.json

## Other

ZSH dotfiles load order:
.zshenv → .zprofile → .zshrc → .zlogin → .zlogout
