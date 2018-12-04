#!/usr/bin/env bash

# Use Cask within Brew to deploy some more software 
brew tap caskroom/caskroom
declare -a cask_apps=(

‘adobe-creative-cloud’
‘alfred’
‘authy’
'iterm2'
'vmware-fusion'
'google chrome'
'powershell'
'vlc'
'spotify'
‘google-chrome’
‘postman’
‘slack’
'firefox' 
'nextcloud'
'istatmenus'
'fish'
'remote desktop manager'
'github'
)

for app in "${cask_apps[@]}"; do
  brew cask install "$app"
  done
  