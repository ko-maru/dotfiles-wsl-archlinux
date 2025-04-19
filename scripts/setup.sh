#!/bin/zsh
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# zshのセットアップ
setup_zsh() {
  ln -snfv "${DOTFILES_DIR}/.zshrc" "${HOME}/.zshrc"
}

# Gitのセットアップ
setup_git() {
  ln -snfv "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"
}

# starshipのセットアップ
setup_starship() {
  ln -snfv "${DOTFILES_DIR}/.config/starship.toml" "${HOME}/.config/starship.toml"
}

# tmuxのセットアップ
setup_tmux() {
  if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
    git clone "https://github.com/tmux-plugins/tpm" "${HOME}/.tmux/plugins/tpm"
  fi
  ln -snfv "${DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
}

# neovimのセットアップ
setup_neovim() {
  ln -snfv "${DOTFILES_DIR}/.config/nvim" "${HOME}/.config/nvim"
}

# miseのセットアップ
setup_mise() {
  sudo pacman -S mise --noconfirm
  mise use -g usage
}

# 全てのセットアップ
setup_all() {
  setup_zsh
  setup_git
  setup_starship
  setup_tmux
  setup_neovim
  setup_mise
}

# セットアップ実行
setup_all
