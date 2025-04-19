#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

# Install
command -v tmux > /dev/null 2>&1 || sudo pacman -S tmux --noconfirm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Deploy configuration file
./create-symlink.sh ".tmux.conf"
