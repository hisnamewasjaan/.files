#!/bin/sh
# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# More from:
#    https://gist.github.com/brandonb927/3195465
#
# Run ./set-defaults.sh and you'll be good to go.
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

sudo -v

echo ""
echo "› System:"
echo "  › Disable press-and-hold for keys in favor of key repeat"
defaults write -g ApplePressAndHoldEnabled -bool false

echo "  › Show the ~/Library folder"
chflags nohidden ~/Library

echo "  › Show the /Volumes folder"
sudo chflags nohidden /Volumes

echo "  › Set a really fast key repeat"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

echo "  › Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "  › Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

#echo "  › Don't automatically rearrange Spaces based on most recent use"
#defaults write com.apple.dock mru-spaces -bool false

#echo "  › Disable smart quotes and smart dashes as they're annoying when typing code"
#defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
#defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#echo "  › Disable auto-correct"
#defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

#echo "  › Disable auto-capitalization and double-space period"
#defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
#defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -int 0

echo "  › Set up trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 3
defaults write -g com.apple.mouse.scaling 3

echo "  › Avoid the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "  › Show battery percent"
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

echo "  › Removing duplicates in the 'Open With' menu"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \
  -kill -r -domain local -domain system -domain user

#############################

echo ""
echo "› Finder:"
echo "  › Always open everything in Finder's list view"
defaults write com.apple.finder FXPreferredViewStyle Nlsv

echo "  › Set the Finder prefs for showing a few different volumes on the Desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo "  › Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "  › Set sidebar icon size to small"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

echo "  › Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "  › Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "  › Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "  › Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "  › Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "  › Show Hidden Files & Folders"
defaults write com.apple.finder AppleShowAllFiles -boolean true

#############################

echo ""
echo "› Photos:"
echo "  › Disable it from starting everytime a device is plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

#############################

echo ""
echo "› Dock"
echo "  › Setting the icon size of Dock items to 48 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 48

echo "  › Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

echo "  › Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0
echo "  › Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

echo "  › Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "  › Don't animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

echo "  › Show App Switcher on all displays"
defaults write com.apple.dock appswitcher-all-displays -bool true

#############################

echo ""
echo "› iTerm2:"
echo "  › Specify the preferences directory"
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.dotfiles/iTerm"
echo "  › Tell iTerm2 to use the custom preferences in the directory"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
#echo "  › Don’t display the annoying prompt when quitting iTerm"
# defaults write com.googlecode.iterm2 PromptOnQuit -bool false

#############################

echo ""
echo "› Kill related apps"
# Only apps whose settings are changed above, so running apps and terminals are left alone
for app in "cfprefsd" "ControlCenter" "Dock" "Finder" "SystemUIServer"; do
  killall "$app" > /dev/null 2>&1
done
