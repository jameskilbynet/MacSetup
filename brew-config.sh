#!/usr/bin/env bash

# MacSetup Homebrew Configuration
# Customize package lists by editing this file

# Command-line tools (formulas)
HOMEBREW_FORMULAS=(
    # Development Tools
    "ansible"           # Automation tool
    "awscli"            # AWS command line interface
    "helm"              # Kubernetes package manager
    "kubernetes-cli"    # Kubernetes command line tool
    "packer"            # Tool for building machine images
    "terraform"         # Infrastructure as code
    "vault"             # Secrets management
    
    # System Tools
    "mas"               # Mac App Store command line interface
    "nmap"              # Network discovery and security auditing
    "openssl"           # SSL/TLS cryptography library
    "tmux"              # Terminal multiplexer
    "watch"             # Execute commands periodically
    "zsh"               # Z shell
    
    # Utilities
    "asciinema"         # Terminal session recorder
    "mackup"            # Backup and restore application settings
    "ruby"              # Ruby programming language
)

# GUI applications (casks) - Web Browsers
HOMEBREW_BROWSER_CASKS=(
    "firefox"                # Mozilla Firefox
    "google-chrome"          # Google Chrome
)

# GUI applications (casks) - Development Tools
HOMEBREW_DEV_CASKS=(
    "github"                 # GitHub Desktop
    "iterm2"                 # Terminal replacement
    "postman"                # API development environment
    "visual-studio-code"     # Code editor
    "powershell"             # PowerShell Core
)

# GUI applications (casks) - Creative & Productivity
HOMEBREW_CREATIVE_CASKS=(
    "adobe-creative-cloud"   # Adobe Creative Suite
    "grammarly"              # Writing assistant
    "macdown"                # Markdown editor
    "moom"                   # Window management
)

# GUI applications (casks) - System Utilities
HOMEBREW_UTILITY_CASKS=(
    "balenaetcher"           # USB/SD card imaging
    "istat-menus"            # System monitoring
    "remote-desktop-manager" # Remote connection manager
)

# GUI applications (casks) - Media & Entertainment
HOMEBREW_MEDIA_CASKS=(
    "kindle"                 # Amazon Kindle
    "plex"                   # Media server
    "plexamp"                # Music player
    "vlc"                    # Video player
)

# GUI applications (casks) - Communication
HOMEBREW_COMMUNICATION_CASKS=(
    "discord"                # Communication platform
    "signal"                 # Secure messaging
    "zoom"                   # Video conferencing
)

# GUI applications (casks) - Enterprise/Work
HOMEBREW_ENTERPRISE_CASKS=(
    "vmware-horizon-client"  # VMware remote desktop
)

# GUI applications that were incorrectly in the original brew.sh
HOMEBREW_MOVED_CASKS=(
    "nextcloud"              # File sync and share
    "deskpad"                # Virtual desktop backgrounds
    "elgato-stream-deck"     # Stream Deck software
)

# Mac App Store applications (ID => Name mapping)
declare -A MAS_APPLICATIONS=(
    ["926036361"]="Pocket"
    ["1102004240"]="iHosts"
    ["803453959"]="Slack"
)

# PowerShell modules to install
POWERSHELL_MODULES=(
    "VMware.PowerCLI"        # VMware PowerCLI
)

# Function to get all cask applications
get_all_casks() {
    local all_casks=()
    all_casks+=("${HOMEBREW_BROWSER_CASKS[@]}")
    all_casks+=("${HOMEBREW_DEV_CASKS[@]}")
    all_casks+=("${HOMEBREW_CREATIVE_CASKS[@]}")
    all_casks+=("${HOMEBREW_UTILITY_CASKS[@]}")
    all_casks+=("${HOMEBREW_MEDIA_CASKS[@]}")
    all_casks+=("${HOMEBREW_COMMUNICATION_CASKS[@]}")
    all_casks+=("${HOMEBREW_ENTERPRISE_CASKS[@]}")
    all_casks+=("${HOMEBREW_MOVED_CASKS[@]}")
    echo "${all_casks[@]}"
}

# Function to get all formulas
get_all_formulas() {
    echo "${HOMEBREW_FORMULAS[@]}"
}

# Function to get MAS applications
get_mas_applications() {
    for app_id in "${!MAS_APPLICATIONS[@]}"; do
        echo "$app_id:${MAS_APPLICATIONS[$app_id]}"
    done
}

# Function to get PowerShell modules
get_powershell_modules() {
    echo "${POWERSHELL_MODULES[@]}"
}
