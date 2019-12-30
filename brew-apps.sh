#!/usr/bin/env bash

# Use Cask within Brew to deploy some more software 

declare -a cask_apps=(

'adobe-creative-cloud'
'alfred'
'authy'
'balenaetcher'
'cakebrew'
'duet'
'firefox'
'fish'
'filezilla'
'github'
'google-chrome'
'istat-menus'
'iterm2'
'microsoft-teams'
'moom'
'nextcloud'
'osxfuse'
'postman'
'powershell'
'plex-media-player'
'remote-desktop-manager'
'signal'
'slack'
'spotify'
'steam'
'synergy'
'visual-studio-code'
'vlc'
'vmware-fusion'
'whatsapp'
)

for app in "${cask_apps[@]}"; do
  brew cask install "$app"
  done


pwsh Install-Module -Name VMware.PowerCLI -Scope CurrentUser
