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
- Development tools (ansible, terraform, kubernetes-cli, etc.)
- System utilities (mas, nmap, tmux, etc.)
- Mac App Store applications
- Handles Apple Silicon Mac PATH configuration automatically

### `brew-apps.sh`
Installs GUI applications via Homebrew Cask, organized by category:
- **Browsers**: Arc, Firefox, Chrome
- **Development**: GitHub Desktop, iTerm2, VS Code, PostMan
- **Creative**: Adobe Creative Cloud, Grammarly, MacDown
- **Utilities**: Balena Etcher, iStat Menus, Remote Desktop Manager
- **Media**: Kindle, Plex, VLC
- **Communication**: Discord, Signal, Zoom
- **Enterprise**: VMware Horizon Client

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

### `brew-config.sh`
Configuration file for customizing package lists. Edit this file to:
- Add or remove packages from installation lists
- Organize packages by category
- Modify Mac App Store applications
- Configure PowerShell modules

### `defaults.sh`
Applies macOS system preferences and settings.

## Customization

To customize which packages are installed:

1. Edit `brew-config.sh` to modify package lists
2. The scripts will automatically use your customizations
3. You can add/remove packages from any category

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

- **Homebrew installation fails**: Ensure you have Command Line Tools installed: `xcode-select --install`
- **Mac App Store apps fail**: Make sure you're signed in to the App Store
- **Permission errors**: Don't run with `sudo` - Homebrew should install in user space
- **Package installation fails**: Check individual package names with `brew search <package>`

## Contributing

Feel free to submit issues or pull requests to improve these scripts!

## License

This project is open source and available under the MIT License.
