# Setting Up Your New Developer Machine!

# Download and install Homebrew. You will be asked for your password.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install the contents of "./Brewfile"
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/Brewfile" -o ~/Brewfile
echo cat ~/Brewfile
brew bundle --file=~/Brewfile

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir ~/Documents/Repositories

# Download Colorthemes and Settings
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/dracula.zsh-theme" -o ~/.oh-my-zsh/themes/dracula.zsh-theme
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/.zshrc" -o ~/.zshrc
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/vscode-settings.json" -o ~/Library/Application Support/Code/User/settings.json
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/.gitignore-global" -o ~/.gitignore-global

# Git Setup
git config --global core.excludesfile '~/.gitignore-global'
git config --global user.name "Jakob Sautner"
git config --global user.email jakob@sautner.cc
git config --global core.editor code

# Apple Settings
# Show Hidden Files
defaults write com.apple.finder AppleShowAllFiles YES
# System Preferences > General > Click in the scrollbar to: Jump to the spot that's clicked
defaults write -globalDomain "AppleScrollerPagingBehavior" -bool true
# System Preferences > Dock > Size:
defaults write com.apple.dock tilesize -int 50
# System Preferences > Dock > Magnification:
defaults write com.apple.dock magnification -bool true
# System Preferences > Dock > Size (magnified):
defaults write com.apple.dock largesize -int 70
# System Preferences > Dock > Minimize windows using: Scale effect
defaults write com.apple.dock mineffect -string "scale"
# System Preferences > Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true
# System Preferences > Dock > Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true
# System Preferences > Dock > Automatically hide and show the Dock (duration)
defaults write com.apple.dock autohide-time-modifier -float 0.5
# System Preferences > Dock > Automatically hide and show the Dock (delay)
defaults write com.apple.dock autohide-delay -float 0
# System Preferences > Dock > Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true
# System Preferences > Mission Controll > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
# System Preferences > Mission Controll > Dashboard
defaults write com.apple.dock dashboard-in-overlay -bool true
# System Preferences > Keyboard >
defaults write NSGlobalDomain KeyRepeat -int 2
# System Preferences > Keyboard >
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# System Preferences > Trackpad > Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# System Preferences > Accessibility > Mouse & Trackpad > Trackpad Options
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false
# Finder > Preferences > Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder > Preferences > Show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Finder > Preferences > Show warning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true
# Finder > View > As Columns
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# Completely Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true
# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# Generating System specific new RSA key and copy it into clipboard. Paste into Github settings.
ssh-keygen -t rsa -C "jakob@sautner.cc"
pbcopy < ~/.ssh/id_rsa.pub

# Done
echo "Done. Note that some of these changes require a logout/restart to take effect."
echo "Remember to add your new RSA Key to https://github.com/settings/keys"

# Remove temp files
rm -f ~/.Brewfile
