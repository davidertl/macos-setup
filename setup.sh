# Just run this file in your shell. Nothing else needed.

# Download and install Homebrew. You will be asked for your password.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install mas
mas signin

# Install the contents of "./Brewfile"
curl -O "https://raw.githubusercontent.com/lappalal/macos-setup/master/Brewfile"
brew bundle

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Remove temp files
rm -f ./Brewfile