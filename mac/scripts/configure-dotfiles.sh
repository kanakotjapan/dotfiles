#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/_common.sh"

if [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
  log "Backing up existing .zshrc to .zshrc.backup..."
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Keep the XDG config root as a real directory. If it does not exist, Stow
# folds common/.config into a single ~/.config symlink, causing unrelated
# applications to write their local state into this repository.
if [[ -L "$HOME/.config" ]]; then
  error "$HOME/.config must be a real directory before stowing dotfiles"
  exit 1
fi
mkdir -p "$HOME/.config"

log "Initializing git submodules..."
git -C "$DOTFILES_DIR" submodule update --init --recursive

log "Linking configs with stow..."
stow -d "$DOTFILES_DIR" -t ~ common
stow -d "$MAC_DIR" -t ~ stow
