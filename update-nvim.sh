#!/usr/bin/env bash
# update-nvim.sh — Met à jour Neovim AppImage sans sudo
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APPIMAGE="$DOTFILES_DIR/bin/nvim.appimage"
URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"

echo "==> Mise à jour Neovim..."
CURRENT=$(nvim --version 2>/dev/null | head -1 || echo "non installé")
echo "    Version actuelle : $CURRENT"

if command -v curl &>/dev/null; then
  curl -Lo "$APPIMAGE" "$URL"
elif command -v wget &>/dev/null; then
  wget -O "$APPIMAGE" "$URL"
fi

chmod +x "$APPIMAGE"
echo "    ✓ Nouvelle version : $(nvim --version | head -1)"
