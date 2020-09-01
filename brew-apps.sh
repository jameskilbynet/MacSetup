#!/usr/bin/env bash

# Use Cask within Brew to deploy some more software 

declare -a cask_apps=(

'adobe-creative-cloud'
'alfred'
'authy'
'balenaetcher'
'caffeine'
'firefox'
'grammarly'
'github'
'google-chrome'
'istat-menus'
'iterm2'
'keybase'
'macdown'
'microsoft-teams'
'moom'
'osxfuse'
'postman'
'powershell'
'plex-media-player'
'remote-desktop-manager'
'signal'
'slack'
'steam'
'visual-studio-code'
'vlc'
'vmware-fusion'
'whatsapp'
)

for app in "${cask_apps[@]}"; do
  brew cask install "$app"
  done


pwsh Install-Module -Name VMware.PowerCLI -Scope CurrentUser
