#!/bin/bash

echo "╔══════════════════════════════════════════════════════════╗"
echo "║     Oh My Zsh + Extensions + Pyenv Installation         ║"
echo "║     (Manual .zshrc configuration)                       ║"
echo "╚══════════════════════════════════════════════════════════╝"

# ==================== SYSTEM UPDATE ====================
echo "📦 Updating package list..."
sudo apt update

# ==================== INSTALL PREREQUISITES ====================
echo "🔧 Installing prerequisites..."
sudo apt install -y \
    curl \
    git \
    wget \
    zsh \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    ca-certificates

# ==================== INSTALL OH MY ZSH ====================
echo "✨ Installing Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "⚠️ Oh My Zsh already installed. Backing up..."
    mv "$HOME/.oh-my-zsh" "$HOME/.oh-my-zsh.backup.$(date +%Y%m%d)"
fi

# Install Oh My Zsh unattended
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Create custom plugins directory
echo "📁 Creating custom plugins directory..."
mkdir -p ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins

# ==================== INSTALL ZSH PLUGINS ====================
echo "🔌 Installing Zsh extensions..."

# 1. zsh-autosuggestions
echo "   • Installing zsh-autosuggestions..."
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "     ✅ Installed"
else
    echo "     ✅ Already installed"
fi

# 2. zsh-syntax-highlighting
echo "   • Installing zsh-syntax-highlighting..."
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "     ✅ Installed"
else
    echo "     ✅ Already installed"
fi

# 3. zsh-history-substring-search
echo "   • Installing zsh-history-substring-search..."
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search" ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
    echo "     ✅ Installed"
else
    echo "     ✅ Already installed"
fi

# 4. zsh-completions
echo "   • Installing zsh-completions..."
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
    echo "     ✅ Installed"
else
    echo "     ✅ Already installed"
fi

# 5. Powerlevel10k theme (optional)
echo "🎨 Installing Powerlevel10k theme..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "     ✅ Installed"
else
    echo "     ✅ Already installed"
fi

# ==================== INSTALL PYENV ====================
echo "🐍 Installing pyenv (Python Version Manager)..."

# Remove existing pyenv if any
if [ -d "$HOME/.pyenv" ]; then
    echo "⚠️ Pyenv already installed. Backing up..."
    mv "$HOME/.pyenv" "$HOME/.pyenv.backup.$(date +%Y%m%d)"
fi

# Install pyenv
curl https://pyenv.run | bash

# Add pyenv to PATH temporarily for this script
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

echo "✅ Pyenv installed successfully"

# ==================== INSTALL ADDITIONAL TOOLS ====================
echo "🛠️ Installing additional tools..."
sudo apt install -y \
    bat \
    exa \
    fd-find \
    ripgrep \
    fzf \
    tldr \
    httpie \
    tree \
    neofetch \
    screenfetch \
    jq \
    htop \
    ncdu \
    tmux \
    unzip \
    zip

# Create symbolic links for tools with different names on Ubuntu
mkdir -p ~/.local/bin

if [ ! -f ~/.local/bin/bat ] && [ -f /usr/bin/batcat ]; then
    ln -s /usr/bin/batcat ~/.local/bin/bat
    echo "   • Created bat symlink"
fi

if [ ! -f ~/.local/bin/fd ] && [ -f /usr/bin/fdfind ]; then
    ln -s /usr/bin/fdfind ~/.local/bin/fd
    echo "   • Created fd symlink"
fi

# Add ~/.local/bin to PATH if not already
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# ==================== BACKUP EXISTING .ZSHRC ====================
if [ -f ~/.zshrc ]; then
    echo "💾 Backing up existing .zshrc to .zshrc.backup.$(date +%Y%m%d)"
    cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d)
    echo "   Your original .zshrc is saved as ~/.zshrc.backup.$(date +%Y%m%d)"
fi

# ==================== CREATE PLUGINS LIST FILE ====================
echo "📝 Creating plugins reference file..."
cat > ~/zsh-plugins-reference.txt << 'EOF'
==================== ZSH PLUGINS INSTALLED ====================
Location: ~/.oh-my-zsh/custom/plugins/

1. zsh-autosuggestions
   - Provides command suggestions based on history
   - Usage: Start typing and see gray suggestions, press → to accept

2. zsh-syntax-highlighting
   - Colors commands: green=valid, red=invalid, blue=directory, etc.

3. zsh-history-substring-search
   - Search history by typing partial commands
   - Usage: Type part of command, press ↑/↓ to search

4. zsh-completions
   - Additional completion definitions

5. Powerlevel10k Theme
   - Location: ~/.oh-my-zsh/custom/themes/powerlevel10k
   - Run 'p10k configure' to setup

==================== PYENV INSTALLED ====================
Location: ~/.pyenv/

Basic pyenv commands:
- pyenv install --list        # List available Python versions
- pyenv install 3.10.12       # Install Python 3.10.12
- pyenv global 3.10.12        # Set global Python version
- pyenv versions              # List installed versions
- pyenv virtualenv venv-name  # Create virtual environment

==================== ADDITIONAL TOOLS ====================
- bat (better cat)           # Use: bat file.txt
- exa (better ls)            # Use: exa -la
- fd (better find)           # Use: fd pattern
- ripgrep (better grep)      # Use: rg pattern
- fzf (fuzzy finder)         # Use: Ctrl+R for history, Ctrl+T for files
- tldr (simplified man)      # Use: tldr command
- neofetch/screenfetch       # System info display
- htop (better top)          # Process viewer
- ncdu (disk usage analyzer) # Use: ncdu

==================== TO ENABLE PLUGINS ====================
Add to your ~/.zshrc:

plugins=(
    git
    sudo
    ubuntu
    debian
    zsh-autosuggestions
    zsh-syntax-highlighting
    history-substring-search
    zsh-completions
    colored-man-pages
    command-not-found
    extract
    python
    pip
    docker
    web-search
)

# For Powerlevel10k theme, set in ~/.zshrc:
ZSH_THEME="powerlevel10k/powerlevel10k"

# For pyenv, add to ~/.zshrc:
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

==========================================================
EOF

echo "✅ Plugins reference saved to ~/zsh-plugins-reference.txt"

# ==================== SET ZSH AS DEFAULT SHELL ====================
echo "⚙️ Setting Zsh as default shell..."
chsh -s $(which zsh)

# ==================== SUMMARY ====================
echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║     🎉 INSTALLATION COMPLETE!                           ║"
echo "╠══════════════════════════════════════════════════════════╣"
echo "║                                                          ║"
echo "║  ✅ Oh My Zsh installed                                 ║"
echo "║  ✅ Zsh plugins installed:                              ║"
echo "║      • zsh-autosuggestions                              ║"
echo "║      • zsh-syntax-highlighting                          ║"
echo "║      • history-substring-search                         ║"
echo "║      • zsh-completions                                  ║"
echo "║      • Powerlevel10k theme                              ║"
echo "║                                                          ║"
echo "║  ✅ Pyenv installed                                      ║"
echo "║  ✅ Additional tools installed                           ║"
echo "║                                                          ║"
echo "║  📄 Reference file created:                             ║"
echo "║      ~/zsh-plugins-reference.txt                        ║"
echo "║                                                          ║"
echo "║  ⚠️  NEXT STEPS:                                         ║"
echo "║  1. Log out and log back in (or run 'exec zsh')         ║"
echo "║  2. Manually edit your ~/.zshrc file                    ║"
echo "║  3. Add plugins to the plugins=() list                  ║"
echo "║  4. Add pyenv configuration (see reference file)        ║"
echo "║  5. Run 'p10k configure' for Powerlevel10k setup        ║"
echo "║                                                          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
echo "Quick commands to edit .zshrc:"
echo "  nano ~/.zshrc"
echo "  # or"
echo "  code ~/.zshrc  (if VS Code is installed)"
echo ""
echo "To start Zsh immediately without logging out:"
echo "  exec zsh"
