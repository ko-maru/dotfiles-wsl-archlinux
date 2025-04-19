#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

# Install
command -v starship > /dev/null 2>&1 || sudo pacman -S starship --noconfirm

# Deploy configuration file
./create-symlink.sh ".config/starship.toml"
