#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/_common.sh"

if ! command -v brew &>/dev/null; then
  warn "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v brew &>/dev/null; then
  error "Homebrew installation failed or PATH not set correctly."
  exit 1
fi

log "Homebrew found: $(brew --version | head -n1)"

if [[ ! -f "$MAC_DIR/Brewfile" ]]; then
  error "Brewfile not found at $MAC_DIR/Brewfile"
  error "Please create it or run './mac/dump.sh' to generate one."
  exit 1
fi

log "Installing packages from Brewfile..."
brew bundle install --file="$MAC_DIR/Brewfile"

if ! command -v stow &>/dev/null; then
  error "stow not found after brew bundle. Something went wrong."
  exit 1
fi

log "stow found: $(stow --version | head -n1)"
