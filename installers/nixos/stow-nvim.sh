
#!/usr/bin/env bash
set -euo pipefail

# Script to stow Neovim config from dotfiles
# Place this in: ~/dotfiles/installers/nixOS/stow-nvim.sh
# Usage: ./stow-nvim.sh

DOTFILES_DIR="$HOME/dotfiles"
PACKAGE="nvim_lua"
TARGET="$HOME/.config/nvim"

cd "$DOTFILES_DIR"
cd ./configs/apps

echo "Stowing Neovim config from $PACKAGE into $TARGET..."
stow -v -t "$TARGET" "$PACKAGE"

echo "Done! Symlinks created in $TARGET"
