# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Use Brew to inatall a few  usefull tools
brew install ansible
brew install asciinema
brew install awscli
brew install terraform
brew install mackup
brew install openssl
brew install kubernetes-helm
brew install kubernetes-cli
brew install minikube
brew install mas
brew install npm
brew install nmap
brew install packer
brew install ruby
brew install sshfs
brew install vault
brew install watch
brew install tmux
brew install zsh
brew cleanup
# Install apps using MAS
echo   Sign In to Apple store

#tweetdeck
mas install 485812721
#pocket
mas install 926036361
#ihosts
mas install 1102004240 
#pocket
mas install 568494494 
#slack
mas install 803453959 
