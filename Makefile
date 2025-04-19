# dotfilesディレクトリの絶対パス
DOTFILES_DIR = $(realpath $(dir $(firstword $(MAKEFILE_LIST))))
# セットアップスクリプトが格納されたパス
SCRIPT_DIR = scripts

.PHONY:
all: setup

.PHONY:
setup: setup-utilities setup-git setup-zsh setup-neovim setup-starship \
	setup-tmux setup-mise setup-nodejs setup-dotnet setup-awscli
	@echo "Setup completed"

.PHONY:
setup-utilities:
	@sudo pacman -S --noconfirm man-db unzip fzf ripgrep eza fd bat lazygit \
		git-delta zoxide git openssh

.PHONY:
setup-git:
	@$(SCRIPT_DIR)/setup-git.sh

.PHONY:
setup-zsh:
	@$(SCRIPT_DIR)/setup-zsh.sh

.PHONY:
setup-neovim:
	@$(SCRIPT_DIR)/setup-neovim.sh

.PHONY:
setup-starship:
	@$(SCRIPT_DIR)/setup-starship.sh

.PHONY:
setup-tmux:
	@$(SCRIPT_DIR)/setup-tmux.sh

.PHONY:
setup-mise:
	@command -v mise > /dev/null 2>&1 || pacman -S --noconfirm mise

.PHONY:
setup-nodejs: setup-mise
	@command -v node > /dev/null 2>&1 || mise use --global node@lts

.PHONY:
setup-dotnet: setup-mise
	@command -v dotnet > /dev/null 2>&1 || mise use --global dotnet@8

.PHONY:
setup-awscli: setup-mise
	@command -v aws > /dev/null 2>&1 || mise use --global aws-cli
