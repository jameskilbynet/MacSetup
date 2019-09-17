# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Use Brew to inatall a few  usefull tools
brew install awscli
brew install terraform
brew install mackup
brew install openssl
brew install mas
brew install npm
brew install nmap
brew install sshfs
brew install watch
brew install tmux
brew install zsh
brew cleanup
# Install apps using MAS
echo   Sign In to Apple store

#tweetdeck
mas install 485812721
#todoist 
mas install 585829637
#pocket
mas install 568494494b
#lastpass
mas install 926036361
#ihosts
mas install 1102004240 
# Gemini 2
mas install 1090488118 
