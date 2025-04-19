#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

# Install
command -v nvim > /dev/null 2>&1 || sudo pacman -S nvim --noconfirm

# Deploy configuration file
./create-symlink.sh ".config/nvim"
