#!/usr/bin/env bash

# Use Cask within Brew to deploy some more software 

declare -a cask_apps=(

'adobe-creative-cloud'
'alfred'
'authy'
'iterm2'
'vmware-fusion'
'powershell'
'vlc'
'spotify'
'google-chrome'
'postman'
'slack'
'firefox' 
'nextcloud'
'istat-menus'
'fish'
'remote-desktop-manager'
'github'
'droplr'
'controlpane'
'chromecast'
'synergy'
'duet'
)

for app in "${cask_apps[@]}"; do
  brew cask install "$app"
  done
