# Just run this file in your shell. Nothing else needed.

# Download and install Homebrew. You will be asked for your password.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install the contents of "./Brewfile"
wget https://gist.githubusercontent.com/lappalal/ed86dcf85718394b1366b4791e947076/raw/648512aadee5b2b4a88de2b50b2ae662d963be38/Brewfile
brew bundle