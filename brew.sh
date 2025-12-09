#!/usr/bin/env bash

# MacSetup Homebrew Installation Script
# Installs Homebrew and essential command-line tools

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Homebrew is installed
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        log_info "Homebrew not found. Installing Homebrew..."
        if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
            log_success "Homebrew installed successfully"
            
            # Add Homebrew to PATH for Apple Silicon Macs
            if [[ $(uname -m) == "arm64" ]]; then
                echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
                eval "$(/opt/homebrew/bin/brew shellenv)"
            fi
        else
            log_error "Failed to install Homebrew"
            exit 1
        fi
    else
        log_info "Homebrew already installed"
    fi
}

# Update Homebrew
update_homebrew() {
    log_info "Updating Homebrew..."
    if brew update; then
        log_success "Homebrew updated successfully"
    else
        log_warning "Failed to update Homebrew, continuing..."
    fi
}

# Install formula packages
install_formulas() {
    log_info "Installing Homebrew formulas..."
    
    # Add HashiCorp tap for their tools
    log_info "Adding HashiCorp tap..."
    brew tap hashicorp/tap
    
    # Define formula packages (command-line tools)
    local formulas=(
        # DevOps & Infrastructure
        "ansible"           # Automation tool
        "awscli"            # AWS command line interface
        "govc"              # vSphere CLI
        "helm"              # Kubernetes package manager
        "kubernetes-cli"    # Kubernetes command line tool
        "kubectx"           # Switch kubectl contexts
        "k9s"               # Kubernetes TUI
        "hashicorp/tap/packer"  # Tool for building machine images
        "hashicorp/tap/terraform"  # Infrastructure as code
        "hashicorp/tap/vault"      # Secrets management
        
        # Modern CLI Tools
        "bat"               # Better cat with syntax highlighting
        "btop"              # Better system monitor
        "eza"               # Modern ls replacement
        "fd"                # Better find
        "fzf"               # Fuzzy finder
        "git-delta"         # Beautiful git diffs
        "httpie"            # Better curl for APIs
        "jq"                # JSON processor
        "lazygit"           # Terminal UI for git
        "ripgrep"           # Faster grep
        "tldr"              # Simplified man pages
        "zoxide"            # Smart cd
        
        # System Utilities
        "asciinema"         # Terminal session recorder
        "htop"              # Better top
        "mackup"            # Backup and restore application settings
        "mas"               # Mac App Store command line interface
        "ncdu"              # Disk usage analyzer
        "nmap"              # Network discovery and security auditing
        "openssl"           # SSL/TLS cryptography library
        "tmux"              # Terminal multiplexer
        "watch"             # Execute commands periodically
        
        # Programming Languages
        "ruby"              # Ruby programming language
        "zsh"               # Z shell
    )
    
    # Install formulas in batch for better performance
    if brew install "${formulas[@]}"; then
        log_success "All formulas installed successfully"
    else
        log_warning "Some formulas may have failed to install. Checking individually..."
        
        # Install individually to identify failures
        for formula in "${formulas[@]}"; do
            if brew install "$formula" 2>/dev/null; then
                log_success "Installed: $formula"
            else
                log_error "Failed to install: $formula"
            fi
        done
    fi
}

# Install cask applications (GUI apps that were incorrectly in formulas)
install_gui_casks() {
    log_info "Installing GUI applications via Homebrew Cask..."
    
    # These were incorrectly listed as formulas in the original script
    local gui_casks=(
        "discord"           # Communication platform
        "deskpad"           # Virtual desktop backgrounds
        "elgato-stream-deck" # Stream Deck software
        "nextcloud"         # File sync and share
        "zoom"              # Video conferencing (was 'zoomus')
    )
    
    for cask in "${gui_casks[@]}"; do
        if brew install --cask "$cask" 2>/dev/null; then
            log_success "Installed cask: $cask"
        else
            log_warning "Failed to install cask: $cask (may not exist or already installed)"
        fi
    done
}

# Install Mac App Store applications
install_mas_apps() {
    log_info "Installing Mac App Store applications..."
    
    # Check if signed in to Mac App Store
    if ! mas account &>/dev/null; then
        log_warning "Please sign in to the Mac App Store before running this script"
        log_info "You can sign in through System Preferences > Apple ID or by opening the App Store"
        read -p "Press Enter after signing in to continue, or Ctrl+C to skip MAS installations..."
    fi
    
    # Define MAS applications with names for clarity
    declare -A mas_apps=(
        ["926036361"]="Pocket"
        ["1102004240"]="iHosts"
        ["568494494"]="Kaspersky Internet Security"
        ["803453959"]="Slack"
    )
    
    for app_id in "${!mas_apps[@]}"; do
        local app_name="${mas_apps[$app_id]}"
        log_info "Installing $app_name (ID: $app_id)..."
        
        if mas install "$app_id"; then
            log_success "Installed: $app_name"
        else
            log_error "Failed to install: $app_name (ID: $app_id)"
        fi
    done
}

# Cleanup
cleanup_homebrew() {
    log_info "Cleaning up Homebrew..."
    if brew cleanup; then
        log_success "Homebrew cleanup completed"
    else
        log_warning "Homebrew cleanup had issues"
    fi
}

# Main execution
main() {
    log_info "Starting Homebrew setup..."
    
    install_homebrew
    update_homebrew
    install_formulas
    install_gui_casks
    install_mas_apps
    cleanup_homebrew
    
    log_success "Homebrew setup completed!"
    log_info "You may need to restart your terminal or run 'source ~/.zprofile' to use newly installed tools"
}

# Run main function
main "$@"
