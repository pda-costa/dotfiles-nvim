#!/usr/bin/env bash
# install.sh — Setup dotfiles nvim (Fedora + Debian/Scibian, sans sudo)
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
BIN_DIR="$HOME/.local/bin"
NVIM_APPIMAGE_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"

echo "==> Dotfiles Neovim - Installation"

# --- 1. Symlink config nvim ---
echo "--> Config Neovim..."
if [ -d "$NVIM_CONFIG_DIR" ] && [ ! -L "$NVIM_CONFIG_DIR" ]; then
  BACKUP="$NVIM_CONFIG_DIR.backup.$(date +%Y%m%d_%H%M%S)"
  echo "    Backup de l'existant → $BACKUP"
  mv "$NVIM_CONFIG_DIR" "$BACKUP"
fi

# mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES_DIR/nvim" "$NVIM_CONFIG_DIR"
echo "    ✓ Symlink créé : $NVIM_CONFIG_DIR → $DOTFILES_DIR/nvim"

# --- 2. Neovim AppImage ---
mkdir -p "$BIN_DIR"
mkdir -p "$DOTFILES_DIR/bin"

if [ ! -f "$DOTFILES_DIR/bin/nvim.appimage" ]; then
  echo "--> Téléchargement Neovim AppImage..."
  if command -v curl &>/dev/null; then
    curl -Lo "$DOTFILES_DIR/bin/nvim.appimage" "$NVIM_APPIMAGE_URL"
  elif command -v wget &>/dev/null; then
    wget -O "$DOTFILES_DIR/bin/nvim.appimage" "$NVIM_APPIMAGE_URL"
  else
    echo "    ✗ Ni curl ni wget disponible. Télécharge manuellement :"
    echo "    $NVIM_APPIMAGE_URL"
    echo "    → Place le fichier dans $DOTFILES_DIR/bin/nvim.appimage"
    exit 1
  fi
fi

chmod +x "$DOTFILES_DIR/bin/nvim.appimage"
ln -sfn "$DOTFILES_DIR/bin/nvim.appimage" "$BIN_DIR/nvim"
echo "    ✓ Neovim disponible dans $BIN_DIR/nvim"

# --- 3. PATH ---
SHELL_RC="$HOME/.bashrc"
[ -n "$ZSH_VERSION" ] && SHELL_RC="$HOME/.zshrc"

if ! grep -q "$BIN_DIR" "$SHELL_RC" 2>/dev/null; then
  echo "export PATH=\"$BIN_DIR:\$PATH\"" >> "$SHELL_RC"
  echo "    ✓ PATH mis à jour dans $SHELL_RC"
fi

echo ""
echo "==> Installation terminée !"
echo "    Lance : source $SHELL_RC && nvim"
