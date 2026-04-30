#!/usr/bin/env bash

# MacSetup Mac App Store Installation Script
# Installs App Store apps via the `mas` CLI

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error()   { echo -e "${RED}[ERROR]${NC} $1"; }

# ──────────────────────────────────────────────
# App list — add/remove entries here
# Format: ["APP_ID"]="App Name"
# Find IDs: mas search <name>
# ──────────────────────────────────────────────
declare -A MAS_APPS=(
    ["1102004240"]="iHosts"
)

check_mas() {
    if ! command -v mas &>/dev/null; then
        log_error "'mas' is not installed. Run brew.sh first (it installs mas)."
        exit 1
    fi
}

check_signed_in() {
    if ! mas account &>/dev/null; then
        log_warning "Not signed in to the Mac App Store."
        log_info "Open the App Store app, sign in, then press Enter to continue."
        log_info "Or press Ctrl+C to skip MAS installations entirely."
        read -rp "" _
        # Re-check after waiting
        if ! mas account &>/dev/null; then
            log_error "Still not signed in — skipping MAS installations."
            exit 1
        fi
    fi
    log_success "Signed in as: $(mas account)"
}

install_mas_apps() {
    log_info "Installing Mac App Store applications..."

    local failed=()
    local succeeded=()

    for app_id in "${!MAS_APPS[@]}"; do
        local app_name="${MAS_APPS[$app_id]}"
        log_info "Installing ${app_name} (ID: ${app_id})..."

        if mas install "$app_id" 2>/dev/null || mas install "$app_id"; then
            log_success "Installed: ${app_name}"
            succeeded+=("$app_name")
        else
            log_error "Failed to install: ${app_name} (ID: ${app_id})"
            failed+=("${app_name} (${app_id})")
        fi
    done

    echo
    log_success "Installed ${#succeeded[@]} of ${#MAS_APPS[@]} apps"

    if [[ ${#failed[@]} -gt 0 ]]; then
        log_warning "Failed to install ${#failed[@]} app(s):"
        for f in "${failed[@]}"; do
            echo "  - $f"
        done
        log_info "Retry manually: mas install <id>"
    fi
}

main() {
    log_info "Starting Mac App Store setup..."
    check_mas
    check_signed_in
    install_mas_apps
    log_success "Mac App Store setup complete!"
}

main "$@"
