# Set up a new mac (M2)

Checklist for setting up new mac

### Setup iCloud account
Usually prompted for on initial boot

### install Xcode command line tools
(required by homebrew)

```shell
> xcode-select --install
```
verify
```shell
> xcode-select -p
```

### Install homebrew

Install [homebrew](https://brew.sh).
You might want to check these [tips](https://www.freecodecamp.org/news/install-xcode-command-line-tools/)
before starting,.
```shell
> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
and follow instructions as listed in terminal


### Sync .ssh folder fom a previous mac to new mac
I have not yet found a good way to make this more automated.

#### Enable Remote login

Grant [full disk access to terminal](https://apple.stackexchange.com/questions/351632/is-there-command-to-grant-full-disk-access-for-specific-application),
and then
```console
> sudo systemsetup -setremotelogin on
```

#### Check username and hostname
```console
> whoami
> hostname
```
#### rsync from previous mac
Then from old machine run the following inserting appropriate username and hostname
```shell
> rsync -avz /Users/janemilbentzen/.ssh/ janemilbentzen@jans-mbp.lan:~/.ssh/
```

### Clone dotfiles

```shell
> git clone --recurse-submodules git@github.com:hisnamewasjaan/.files.git ~/.dotfiles
```

See what is available
```shell
> cd ~/.dotfiles
> make
```

Do NOT run `make install` just yet

### Install brew bundles
```shell
> make brew-restore
```

```shell
> brew doctor
```
should be all happy.

### install sdkman
Install [sdkman](https://sdkman.io/install)

```shell
> curl -s "https://get.sdkman.io" | bash
```

### powerlevel10 theme
install
```shell
> git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```


### run dotbot to set up all configured symlinks and dotfiles
Run dotbot to setup all dotfiles symlinks.
```shell
> make install
```

### Jetbrains Toolbox

### ESET Endpoint Security

### ERST specific setup
- vpn
- .sit folder
- need to build openconnect branch add_local_id_option
```shell
❯ git clone --branch add_local_id_option --single-branch git@gitlab.com:openconnect/openconnect.git
````

Follow [instructions here](https://www.infradead.org/openconnect/building.html) to build
```shell
❯ sudo mkdir /etc/vpnc
❯ sudo curl https://gitlab.com/openconnect/vpnc-scripts/raw/master/vpnc-script --output /etc/vpnc/vpnc-script
❯ sudo chmod +x /etc/vpnc/vpnc-script
❯ brew install automake
...
❯ brew install OpenSSL
...
❯ ./autogen.sh
❯ ./configure
❯ make
... warnings are ok
❯ sudo make install
```

Sync `~/.sit` folder from computer on same network
```shell
rsync -avz janemilbentzen@jbe-mac-01.nine.dk:~/.sit/ /Users/janemilbentzen/.sit/
```
