#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

# Install
command -v zsh > /dev/null 2>&1 || \
  sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions --noconfirm

# Deploy configuration file
./create-symlink.sh ".zshrc"

# Change login shell
if [ "${SHELL}" != "$(command -v zsh)" ]; then
  sudo chsh --shell "$(command -v zsh)" "$(whoami)"
fi
