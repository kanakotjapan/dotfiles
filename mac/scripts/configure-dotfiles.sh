#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/_common.sh"

if [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
  log "Backing up existing .zshrc to .zshrc.backup..."
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

log "Initializing git submodules..."
git -C "$DOTFILES_DIR" submodule update --init --recursive

log "Linking configs with stow..."
stow -d "$DOTFILES_DIR" -t ~ common
stow -d "$MAC_DIR" -t ~ stow
