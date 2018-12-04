#!/usr/bin/env bash

# Install apps

brew tap caskroom/caskroom

# Use Cask within Brew to deploy some more software 
declare -a cask_apps=(

‘adobe-creative-cloud’
‘alfred’
‘authy’
'iterm2'
'vmware-fusion'
'google chrome'
'powershell'
‘flume’
'vlc'
'spotify'
‘google-chrome’
‘postman’
‘slack’
'firefox' 
'nextcloud'
'istatmenus'
)

for app in "${cask_apps[@]}"; do
  brew cask install "$app"