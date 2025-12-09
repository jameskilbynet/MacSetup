#!/usr/bin/env bash

# MacSetup Git Configuration
# Configures global git settings including gitignore

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print functions
print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Main script
print_header "Git Configuration Setup"

# Get the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if gitignore_global exists
if [ ! -f "$SCRIPT_DIR/gitignore_global" ]; then
    print_error "gitignore_global file not found in $SCRIPT_DIR"
    exit 1
fi

# Copy gitignore_global to home directory
print_info "Installing global gitignore..."
cp "$SCRIPT_DIR/gitignore_global" "$HOME/.gitignore_global"
print_success "Copied gitignore_global to ~/.gitignore_global"

# Configure git to use the global gitignore
print_info "Configuring git to use global gitignore..."
git config --global core.excludesfile "$HOME/.gitignore_global"
print_success "Git configured to use ~/.gitignore_global"

# Optional: Configure other useful git settings
print_info "Configuring additional git settings..."

# Set default branch name to main
if ! git config --global init.defaultBranch &>/dev/null; then
    git config --global init.defaultBranch main
    print_success "Set default branch name to 'main'"
fi

# Enable color output
git config --global color.ui auto
print_success "Enabled colored git output"

# Configure pull behavior
if ! git config --global pull.rebase &>/dev/null; then
    git config --global pull.rebase false
    print_success "Configured pull behavior (merge)"
fi

print_header "Git Configuration Complete"

echo -e "${GREEN}Summary:${NC}"
echo -e "  • Global gitignore installed at ~/.gitignore_global"
echo -e "  • Git configured to exclude .DS_Store and other macOS files globally"
echo -e "  • Default branch set to 'main'"
echo -e "  • Colored output enabled"
echo ""
echo -e "${BLUE}Note:${NC} This will prevent .DS_Store files from being tracked in any git repository on this machine."
