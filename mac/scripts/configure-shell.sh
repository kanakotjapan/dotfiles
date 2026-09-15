#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/_common.sh"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  log "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  log "oh-my-zsh already installed"
fi
