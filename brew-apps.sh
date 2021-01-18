#!/usr/bin/env bash

# Use Cask within Brew to deploy some more software 

declare -a cask_apps=(

'adobe-creative-cloud'
'alfred'
'authy'
'balenaetcher'
'firefox'
'grammarly'
'github'
'google-chrome'
'istat-menus'
'iterm2'
'keybase'
'krisp'
'kindle'
'macdown'
'microsoft-teams'
'moom'
'osxfuse'
'postman'
'powershell'
'plex-media-player'
'plexamp'
'remote-desktop-manager'
'signal'
'slack'
'visual-studio-code'
'vlc'
'vmware-fusion'
'vmware-horizon-client'
)

for app in "${cask_apps[@]}"; do
  brew install --cask "$app"
  done


pwsh Install-Module -Name VMware.PowerCLI -Scope CurrentUser
