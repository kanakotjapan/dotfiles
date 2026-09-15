#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAC_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DOTFILES_DIR="$(cd "$MAC_DIR/.." && pwd)"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

log()   { echo -e "\033[1;32m[+]\033[0m $*"; }
warn()  { echo -e "\033[1;33m[!]\033[0m $*"; }
error() { echo -e "\033[1;31m[-]\033[0m $*"; }
