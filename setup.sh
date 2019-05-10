# Just run this file in your shell. Nothing else needed.
# Download and install Homebrew. You will be asked for your password.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install the contents of "./Brewfile"
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/Brewfile" -o ~/Brewfile
brew bundle ~/Brewfile

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir ~/Documents/Repositories

# Generating System specific new RSA key and copy it into clipboard. Paste into Github settings.
ssh-keygen -t rsa -C "jakob@sautner.cc"
pbcopy < ~/.ssh/id_rsa.pub

# Download Colorthemes and Settings
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/dracula.zsh-theme" -o ~/.oh-my-zsh/themes/dracula.zsh-theme
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/.zshrc" -o ~/.zshrc
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/vscode-settings.json" -o ~/Library/Application Support/Code/User/settings.json
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/.gitignore-global" -o ~/.gitignore-global

# Additional Setup
git config --global core.excludesfile '~/.gitignore-global'
git config --global user.name "Jakob Sautner"
git config --global user.email jakob@sautner.cc
git config --global core.editor code

# Remove temp files
rm -f ~/Brewfile