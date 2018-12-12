#!/usr/bin/env bash

# Use Cask within Brew to deploy some more software 

declare -a cask_apps=(

'adobe-creative-cloud'
'alfred'
'authy'
'chromecast'
'controlpane'
'droplr'
'duet'
'firefox'
'fish'
'github'
'google-chrome'
'istat-menus'
'iterm2'
'nextcloud'
'postman'
'powershell'
'remote-desktop-manager'
'slack'
'spotify'
'steam'
'synergy'
'visual-studio-code'
'vlc'
'vmware-fusion'
)

for app in "${cask_apps[@]}"; do
  brew cask install "$app"
  done
