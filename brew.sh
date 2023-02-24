# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#Use Brew to inatall a few  usefull tools
brew install ansible
brew install asciinema
brew install awscli
brew install cloudflare-warp
brew install discord
brew install homebrew/cask-drivers/elgato-stream-deck
brew install terraform
brew install mackup
brew install openssl
brew install helm
brew install kubernetes-cli
brew install minikube
brew install mist
brew install mas
brew install npm
brew install nmap
brew install packer
brew install ruby
brew install synology-drive
brew install vault
brew install watch
brew install tmux
brew install zoomus
brew install zsh
brew cleanup
# Install apps using MAS
echo   Sign In to Apple store


#pocket
mas install 926036361
#ihosts
mas install 1102004240 
#pocket
mas install 568494494 
#slack
mas install 803453959 
