<div align="center">

# Oh My Zsh Custom Developer Shell Setup

[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Linux-blue.svg)]()
[![Compatible](https://img.shields.io/badge/Compatible-Debian%20%7C%20Ubuntu%20%7C%20Fedora-brightgreen.svg)]()

A streamlined, automated Oh My Zsh configuration packed with productivity aliases, Python environment helpers, and powerful CLI utilities. Perfect for developers, DevOps engineers, security professionals, and power users who want a lightning-fast workflow with zero manual configuration.

[Quick Start](#quick-start) | [Aliases](#alias-shortcuts) | [Custom Commands](#custom-commands) | [Keyboard Shortcuts](#keyboard-shortcuts) | [Support](#author--support)

</div>

---

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
- [Alias Shortcuts](#alias-shortcuts)
- [Custom Commands](#custom-commands)
- [Keyboard Shortcuts](#keyboard-shortcuts)
- [Prompt Modes](#prompt-modes)
- [Managing Aliases](#managing-aliases)
- [Useful One-Liners](#useful-one-liners)
- [Troubleshooting](#troubleshooting)
- [Compatibility](#compatibility)
- [License](#license)
- [Author & Support](#author--support)

---

## Features

Packed with everything you need for development:

- **Automated Installation** - One-command setup with Oh My Zsh
- **50+ Developer Aliases** - Preconfigured shortcuts for Git, Docker, Python, and system commands
- **Python Helpers** - Virtual environment shortcuts and package management
- **Docker Shortcuts** - Quick access to common Docker commands
- **Network Utilities** - IP lookup, port scanning, and network diagnostics
- **System Administration** - Package updates, disk usage, memory monitoring
- **Modern CLI Support** - Compatible with `exa`, `bat`, `fzf`, `fd`, and more
- **Multi-Distro Support** - Works seamlessly on Debian, Ubuntu, Fedora, and RHEL-based systems
- **Performance Optimized** - Minimal overhead with maximum productivity
- **Customizable Prompt** - Toggle between two-line and one-line prompt modes

---

## Prerequisites

Before installation, ensure you have:

- **Linux OS** (Debian, Ubuntu, Fedora, or RHEL-based)
- **Zsh** (usually pre-installed on modern systems)
- **Git** installed
- **sudo** access for package installation
- **curl** for downloading resources

Check your system:

```bash
zsh --version
git --version
```

---

## Quick Start

Get up and running in 3 minutes:

### 1. Clone the Repository

```bash
git clone https://github.com/uzairshahidgithub/zsh-custom-config.git
cd zsh-custom-config
```

### 2. Run the Installer

```bash
chmod +x zshinstall.sh
./zshinstall.sh
```

### 3. Copy Configuration File

Choose your system type:

**For Debian/Ubuntu:**
```bash
cp zshconfig(deb).txt ~/.zshrc
```

**For Fedora/RHEL:**
```bash
cp zshconfig(rpm).txt ~/.zshrc
```

### 4. Activate Configuration

```bash
exec zsh
source ~/.zshrc
```

### 5. Set Zsh as Default Shell

```bash
chsh -s $(which zsh)
```

Log out and log back in. Verify with:

```bash
echo $SHELL
# Expected: /usr/bin/zsh
```

**Complete!** Your custom shell is ready to use.

---

## Configuration

### Manual Configuration

If you prefer manual setup:

```bash
rm -f ~/.zshrc
nano ~/.zshrc
```

Copy the entire content from either `zshconfig(deb).txt` or `zshconfig(rpm).txt` into `~/.zshrc`

Save (Ctrl+O, Enter) and exit (Ctrl+X).

### Reload Configuration

After making changes:

```bash
source ~/.zshrc
# or
exec zsh
```

### Edit Configuration

Quick edit shortcut:

```bash
zshconfig    # Opens ~/.zshrc in nano
```

---

## Alias Shortcuts

All aliases are organized by category for easy discovery. Use them to dramatically speed up your workflow.

### System & Shell Management

| Alias | Command | Description |
|-------|---------|-------------|
| `cls` | `clear` | Clear terminal screen |
| `.zsh` | `source ~/.zshrc` | Reload Zsh configuration |
| `zshconfig` | `nano ~/.zshrc` | Edit Zsh config file |
| `sysinfo` | `neofetch \| screenfetch` | Display system information |
| `kernel` | `uname -r` | Show kernel version |
| `free` | `free -h` | Display memory usage |
| `df` | `df -h` | Show disk space usage |

### Navigation & Directory Management

| Alias | Command | Description |
|-------|---------|-------------|
| `..` | `cd ..` | Go up one directory |
| `...` | `cd ../..` | Go up two directories |
| `mkcd` | `mkdir + cd` | Create directory and enter it |
| `ll` | `ls -alF` | Detailed file listing |
| `la` | `ls -A` | Show hidden files |
| `lt` | `ls -ltr` | List files sorted by time |

### Git & Version Control

| Alias | Command | Description |
|-------|---------|-------------|
| `gs` | `git status` | Show repository status |
| `ga` | `git add` | Stage changes |
| `gcm` | `git commit -m` | Commit with message |
| `gpl` | `git pull` | Fetch and merge changes |
| `gps` | `git push` | Push commits to remote |
| `gcl` | `git clone` | Clone repository |

### Docker & Containers

| Alias | Command | Description |
|-------|---------|-------------|
| `dk` | `docker` | Docker CLI |
| `dkps` | `docker ps` | List running containers |
| `dki` | `docker images` | List Docker images |
| `dkex` | `docker exec -it` | Execute command in container |

### Python & Development

| Alias | Command | Description |
|-------|---------|-------------|
| `python` | `python3` | Python interpreter |
| `pip` | `pip3` | Pip package manager |
| `venv` | `python3 -m venv` | Create virtual environment |
| `activate` | `source venv/bin/activate` | Activate venv |

### Network & Connectivity

| Alias | Command | Description |
|-------|---------|-------------|
| `myip` | `curl ifconfig.me` | Display public IP address |
| `localip` | `hostname -I` | Display local IP address |
| `ports` | `ss -tulpn` | List all open ports |

---

## Custom Commands

Powerful custom commands that extend your shell's capabilities:

| Command | Usage | Description |
|---------|-------|-------------|
| `mkcd` | `mkcd folder` | Create a directory and automatically enter it |
| `cheat` | `cheat tar` | Display command examples from cheat.sh |
| `weather` | `weather city` | Get weather information for any city |
| `extract` | `extract file.tar.gz` | Auto-extract any archive format |
| `ff` | `ff filename` | Find files by name recursively |
| `fgrep` | `fgrep text` | Search text content inside files |
| `serve` | `serve` | Start a quick Python HTTP server |
| `backup` | `backup file` | Create timestamped backup of files |
| `sysupdate` | `sysupdate` | Update system packages and tools |
| `updates` | `updates` | Show available package updates |

### Examples

```bash
# Create and navigate to a project folder in one command
mkcd my-awesome-project

# Find a file by name
ff package.json

# Extract any archive type
extract archive.tar.gz

# Start a web server on port 8000
serve

# Get weather for Lahore
weather Lahore

# Search for "error" in all log files
fgrep error logs/
```

---

## Keyboard Shortcuts

Master these essential Zsh keyboard shortcuts:

| Shortcut | Action | Use Case |
|----------|--------|----------|
| `Ctrl + U` | Delete text before cursor | Clear command from cursor to start |
| `Ctrl + K` | Delete text after cursor | Remove rest of line |
| `Ctrl + →` | Move forward one word | Jump to next word |
| `Ctrl + ←` | Move backward one word | Jump to previous word |
| `Ctrl + Delete` | Delete next word | Remove word ahead of cursor |
| `Ctrl + R` | Search command history | Find previous commands |
| `Ctrl + A` | Move to beginning | Jump to start of line |
| `Ctrl + E` | Move to end | Jump to end of line |
| `Tab` | Auto-complete | Complete paths and commands |
| `Home` | Beginning of command | Jump to start of line |
| `End` | End of command | Jump to end of line |
| `Ctrl + P` | Toggle prompt mode | Switch between one-line and two-line prompt |

---

## Prompt Modes

Your shell adapts to your preference with two prompt styles:

### Default Two-Line Prompt

The default elegant prompt displays on two lines with clear visual separation:

```
┌──(user㉿host)-[~/folder]
└─$
```

Features:
- Clear user and hostname display
- Current directory path
- Visual separation with lines

### One-Line Prompt

Compact prompt for terminal real estate conservation:

```
user@host:~/folder$
```

**Toggle between modes with:** `Ctrl + P`

---

## Managing Aliases

### List All Aliases

View every alias defined in your system:

```bash
alias
```

### List All Functions

See all custom functions:

```bash
typeset -f
```

### Search Specific Aliases

Find aliases by keyword:

```bash
# Find all git-related aliases
alias | grep git

# Find docker aliases
alias | grep dk
```

### Create Custom Alias

Add your own aliases by editing `~/.zshrc`:

```bash
zshconfig  # Opens editor
```

Add your alias at the end:

```bash
alias myalias="your command here"
```

Save and reload:

```bash
source ~/.zshrc
```

---

## Useful One-Liners

Quick reference for common tasks:

```bash
update        # Update package list (apt/dnf)
upgrade       # Upgrade all packages to latest
install pkg   # Install a package
..            # Navigate up one directory
mkcd folder   # Create & enter folder instantly
gs            # Check git status
myip          # Show your public IP address
sysinfo       # Display system information
serve         # Start HTTP server (port 8000)
weather NYC   # Check weather forecast
cheat tar     # Learn tar command syntax
extract file  # Extract any compressed file
```

---

## Troubleshooting

### Zsh not setting as default shell
```bash
# Check current shell
echo $SHELL

# Force set Zsh
chsh -s /usr/bin/zsh
```

### Configuration not loading
```bash
# Check for syntax errors
zsh -n ~/.zshrc

# Manually source it
source ~/.zshrc
```

### Permission denied on installer
```bash
# Make sure installer is executable
chmod +x zshinstall.sh
```

---

## Compatibility

| OS | Support |
|---|---------|
| Debian / Ubuntu | Full Support |
| Fedora / RHEL | Full Support |
| CentOS / Rocky Linux | Full Support |
| Arch Linux | Compatible |
| Other Linux Distros | Generally Compatible |
| macOS | Partial Support |
| WSL (Windows) | Full Support |

**Requirements:**
- Zsh 5.0+
- Oh My Zsh
- Git
- Bash (for some utilities)

---

## License

![MIT License](https://img.shields.io/badge/License-MIT-green.svg)

**MIT License** — Free to use, modify, and distribute

See [LICENSE](LICENSE) file for details.

---

### Contributing

Found a bug? Have a feature idea? Contributions are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## Support

For support, email uzairrshahid@gmail.com or join our [Discord Community Codemo Teams](https://linktr.ee/codemoteams).

**If you found this helpful, please consider giving it a star on GitHub!**

Made by [Muhammad Uzair](https://github.com/uzairshahidgithub)
