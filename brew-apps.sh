#!/usr/bin/env bash

# MacSetup Homebrew Cask Applications Installation Script
# Installs GUI applications using Homebrew Cask

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
check_homebrew() {
    if ! command -v brew &> /dev/null; then
        log_error "Homebrew is not installed. Please run brew.sh first."
        exit 1
    fi
    log_info "Homebrew found, proceeding with cask installations..."
}

# Install cask applications
install_cask_apps() {
    log_info "Installing GUI applications via Homebrew Cask..."
    
    # Define cask applications with categories
    # Web Browsers
    local browsers=(
        "firefox"                # Mozilla Firefox
        "google-chrome"          # Google Chrome
    )
    
    # Development Tools
    local dev_tools=(
        "github"                 # GitHub Desktop
        "iterm2"                 # Terminal replacement
        "warp"                   # Warp terminal
        "postman"                # API development environment
        "visual-studio-code"     # Code editor
        "powershell"             # PowerShell Core
    )
    
    # Creative & Productivity
    local creative_tools=(
        "adobe-creative-cloud"   # Adobe Creative Suite
        "moom"                   # Window management
    )
    
    # System Utilities
    local utilities=(
        "balenaetcher"           # USB/SD card imaging
        "cloudflare-warp"        # Cloudflare WARP VPN
        "istat-menus"            # System monitoring
        "remote-desktop-manager" # Remote connection manager
    )
    
    # Media & Entertainment
    local media_apps=(
        "kindle"                 # Amazon Kindle
        "plex"                   # Media server
        "plexamp"                # Music player
        "vlc"                    # Video player
    )
    
    # Communication
    local communication=(
        "signal"                 # Secure messaging
    )
    
    # Enterprise/Work
    local enterprise=(
        "vmware-horizon-client"  # VMware remote desktop
    )
    
    # Combine all arrays
    local all_casks=()
    all_casks+=("${browsers[@]}")
    all_casks+=("${dev_tools[@]}")
    all_casks+=("${creative_tools[@]}")
    all_casks+=("${utilities[@]}")
    all_casks+=("${media_apps[@]}")
    all_casks+=("${communication[@]}")
    all_casks+=("${enterprise[@]}")
    
    # Install casks individually for better error handling
    local failed_casks=()
    local successful_casks=()
    
    for cask in "${all_casks[@]}"; do
        log_info "Installing $cask..."
        if brew install --cask "$cask" 2>/dev/null; then
            log_success "Installed: $cask"
            successful_casks+=("$cask")
        else
            log_error "Failed to install: $cask"
            failed_casks+=("$cask")
        fi
    done
    
    # Summary
    log_info "Installation Summary:"
    log_success "Successfully installed ${#successful_casks[@]} applications"
    
    if [ ${#failed_casks[@]} -gt 0 ]; then
        log_warning "Failed to install ${#failed_casks[@]} applications:"
        for failed in "${failed_casks[@]}"; do
            echo "  - $failed"
        done
        log_info "You can try installing failed applications manually with: brew install --cask <app-name>"
    fi
}

# Setup PowerShell modules (separated from main cask installation)
setup_powershell_modules() {
    log_info "Setting up PowerShell modules..."
    
    # Check if PowerShell is available
    if ! command -v pwsh &> /dev/null; then
        log_warning "PowerShell not found. Make sure it was installed successfully first."
        return 1
    fi
    
    log_info "Installing VMware PowerCLI module..."
    if pwsh -Command "Install-Module -Name VMware.PowerCLI -Scope CurrentUser -Force -AllowClobber"; then
        log_success "VMware PowerCLI module installed successfully"
    else
        log_error "Failed to install VMware PowerCLI module"
    fi
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
    log_info "Starting GUI applications installation..."
    
    check_homebrew
    install_cask_apps
    
    # Ask user if they want to setup PowerShell modules
    echo
    read -p "Do you want to setup PowerShell modules? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup_powershell_modules
    else
        log_info "Skipping PowerShell module setup"
    fi
    
    cleanup_homebrew
    
    log_success "GUI applications installation completed!"
    log_info "Some applications may require additional setup or signing in"
}

# Run main function
main "$@"
