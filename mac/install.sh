#!/usr/bin/env bash
set -euo pipefail

MAC_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$MAC_DIR/scripts/_common.sh"

scripts=(
  install-homebrew
  configure-shell
  configure-development
  configure-containers
  configure-dotfiles
)

log "=== Installing dotfiles (macOS) ==="

for script in "${scripts[@]}"; do
  "$MAC_DIR/scripts/$script.sh"
done

log "=== Installation complete ==="
log ""
log "Next steps:"
log "  1. Restart your terminal (or run 'exec zsh')"
log "  2. Run 'colima start' when you need Docker"
log "  3. Open nvim to trigger plugin installation"
log "  4. Install DaVinci Resolve from https://www.blackmagicdesign.com/products/davinciresolve"
