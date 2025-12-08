# MacSetup

A collection of scripts to setup a factory fresh Mac with essential settings and software. The scripts are designed to be robust, user-friendly, and easily customizable.

## Features

- ✅ **Robust error handling** - Scripts continue gracefully when individual packages fail
- 🎨 **Colored output** - Clear visual feedback with color-coded messages
- 📝 **Detailed logging** - Know exactly what's happening during installation
- 🔧 **Easy customization** - Modify package lists in the configuration file
- 🧹 **Maintenance tools** - Keep your Homebrew installation clean and up-to-date
- 📱 **Mac App Store integration** - Install apps from the App Store via command line
- 🍺 **Homebrew best practices** - Proper formula vs cask separation

## Quick Start

### Option 1: Local Installation (Recommended)

```shell
git clone https://github.com/jameskilbynet/MacSetup.git
cd MacSetup

# Make scripts executable
chmod +x *.sh

# Run the installation scripts
./brew.sh                 # Install Homebrew and command-line tools
./brew-apps.sh            # Install GUI applications
./defaults.sh             # Apply macOS system settings
```

### Option 2: Direct Download

```shell
cd ~/Downloads

# Download and run system defaults
curl -sL https://raw.githubusercontent.com/jameskilbynet/MacSetup/master/defaults.sh | bash

# Download Homebrew scripts
curl -O https://raw.githubusercontent.com/jameskilbynet/MacSetup/master/brew.sh
curl -O https://raw.githubusercontent.com/jameskilbynet/MacSetup/master/brew-apps.sh
curl -O https://raw.githubusercontent.com/jameskilbynet/MacSetup/master/brew-maintenance.sh

# Make executable and run
chmod +x *.sh
./brew.sh
./brew-apps.sh
```

## Scripts Overview

### `brew.sh`
Installs Homebrew and essential command-line tools including:

**Development & DevOps:**
- ansible, awscli, helm, kubernetes-cli
- terraform, packer, vault (HashiCorp tools)
- govc (vSphere CLI), jq (JSON processor)

**System Utilities:**
- mas (Mac App Store CLI), mackup (settings backup)
- nmap, tmux, watch, zsh
- openssl, ruby

**Additional Features:**
- Mac App Store applications (Pocket, iHosts, Slack, etc.)
- Handles Apple Silicon Mac PATH configuration automatically
- Individual package error handling with summary reporting

### `brew-apps.sh`
Installs GUI applications via Homebrew Cask, organized by category:

- **Browsers**: Firefox, Google Chrome
- **Development**: GitHub Desktop, iTerm2, Warp, VS Code, Postman, PowerShell
- **Creative & Productivity**: Adobe Creative Cloud, Moom (window management)
- **System Utilities**: Balena Etcher, iStat Menus, Remote Desktop Manager
- **Media & Entertainment**: Kindle, Plex, Plexamp, VLC
- **Communication**: Discord, Signal, Zoom, Nextcloud, Elgato Stream Deck, Deskpad
- **Enterprise**: VMware Horizon Client

**Features:**
- Optional PowerShell module installation (VMware PowerCLI)
- Individual package error handling
- Installation summary with failed package list

### `brew-maintenance.sh`
Maintenance utilities for keeping Homebrew healthy:
```shell
./brew-maintenance.sh update    # Update all packages
./brew-maintenance.sh cleanup   # Clean up old versions
./brew-maintenance.sh doctor    # Check for issues
./brew-maintenance.sh outdated  # List outdated packages
./brew-maintenance.sh backup    # Create package list backup
./brew-maintenance.sh full      # Run all maintenance tasks
```


### `defaults.sh`
Applies macOS system preferences and settings.

## Customization

To customize which packages are installed:

1. **Edit `brew.sh`**: Modify the `formulas` array (around line 72) to add/remove CLI tools
2. **Edit `brew-apps.sh`**: Modify the category arrays (lines 47-90) to add/remove GUI applications
3. **Mac App Store apps**: Update the `mas_apps` associative array in `brew.sh` (line 142)

### Example: Adding a new CLI tool
```bash
# In brew.sh, add to the formulas array:
local formulas=(
    # ... existing tools ...
    "neofetch"          # System information tool
)
```

### Example: Adding a new GUI app
```bash
# In brew-apps.sh, add to the appropriate category:
local dev_tools=(
    # ... existing tools ...
    "docker"            # Docker Desktop
)
```

## Prerequisites

- macOS (tested on recent versions)
- Internet connection
- For Mac App Store apps: signed in to your Apple ID

## What's New

### Improvements Made:
- ✅ Fixed typos ("inatall" → "install")
- ✅ Separated GUI apps into proper cask installations
- ✅ Added comprehensive error handling
- ✅ Implemented colored logging output
- ✅ Added progress indication and summaries
- ✅ Created modular, maintainable code structure
- ✅ Added maintenance utilities
- ✅ Improved Mac App Store integration
- ✅ Added Apple Silicon Mac support
- ✅ Separated PowerShell module installation
- ✅ Added package categorization and documentation

## Troubleshooting

### Common Issues

**Homebrew installation fails**
```bash
xcode-select --install  # Install Command Line Tools first
```

**Terraform installation conflict**
```bash
# If terraform is already installed from homebrew/core:
brew uninstall terraform
brew install hashicorp/tap/terraform
```

**Mac App Store apps fail**
- Sign in to the App Store before running the script
- The script will pause and wait for you to sign in

**MAS (Mac App Store CLI) errors**
- Some bash compatibility issues may occur with `declare -A`
- MAS installations will be skipped if this occurs
- You can manually install: `mas install <app-id>`

**Permission errors**
- Never run with `sudo` - Homebrew installs in user space
- If you see permission errors, fix with: `sudo chown -R $(whoami) /opt/homebrew`

**Package not found**
```bash
brew search <package>     # Search for correct package name
brew info <package>       # Get package information
```

**Script execution issues**
```bash
chmod +x *.sh            # Ensure scripts are executable
```

## Contributing

Feel free to submit issues or pull requests to improve these scripts!

## License

This project is open source and available under the MIT License.
