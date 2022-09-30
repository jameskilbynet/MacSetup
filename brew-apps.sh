#!/usr/bin/env bash

# Use Cask within Brew to deploy some more software 

declare -a cask_apps=(

'adobe-creative-cloud'
'authy'
'balenaetcher'
'firefox'
'grammarly'
'github'
'google-chrome'
'istat-menus'
'iterm2'
'krisp'
'kindle'
'macdown'
'moom'
'postman'
'powershell'
'plex'
'plexamp'
'remote-desktop-manager'
'signal'
'visual-studio-code'
'vlc'
'vmware-horizon-client'
)

for app in "${cask_apps[@]}"; do
  brew install "$app"
  done


pwsh 
Install-Module -Name VMware.PowerCLI -Scope CurrentUser
