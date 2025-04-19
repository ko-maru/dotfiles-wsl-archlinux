#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

# Install
command -v git > /dev/null 2>&1 || sudo pacman -S git --noconfirm

# Deploy configuration file
./create-symlink.sh ".gitconfig"
