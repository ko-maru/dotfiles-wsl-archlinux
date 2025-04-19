# コマンドの存在判定
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

if command_exists tmux && [ -z "${TMUX}" ]; then
  tmux attach || tmux >/dev/null 2>&1
fi

# コマンド履歴
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history

# 補完を有効化
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# 自動rehash設定
zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook
rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

# キーバインド
# vimモード
export KEYTIMEOUT=5
bindkey -v

# エイリアス
alias sudo='sudo '
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -alh'

# シンタックスハイライト
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
 source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
fi

# オートサジェスト
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Starshipの設定
if command_exists starship; then
  eval "$(starship init zsh)"
fi

# tmuxの設定
if command_exists tmux; then
  alias t='tmux'
fi

# Dockerの設定
if command_exists docker; then
  alias d='docker'
fi

# fzfの設定
if command_exists fzf; then
  source <(fzf --zsh)
  export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
  export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'
  export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
  export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window '~3'"
  export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude .git"
  export FZF_ALT_C_OPTS="--select-1 --exit-0"
  export FZF_TMUX=1
  export FZF_TMUX_OPTS="-p 80%"

  # ファイルパス補完の生成
  _fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
  }
  # ディレクトリパス補完の生成
  _fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
  }
fi

# zoxideの設定
if command_exists zoxide; then
  eval "$(zoxide init zsh)"
fi

# Neovimの設定
if command_exists nvim; then
  export EDITOR=nvim
  export MANPAGER='nvim +Man!'
  alias vi='nvim'
  alias vim='nvim'
fi

# GHQの設定
if command_exists ghq; then
  # リポジトリにcdするコマンド
  cdr() {
    local repository_dir="$(ghq list --full-path | fzf)"
    cd "${repository_dir:-.}"
  }
  # リポジトリを列挙するコマンド
  alias lsr='ghq list --full-path'
fi

# LazyGitの設定
if command_exists lazygit; then
  alias lzg='lazygit'
fi

# LazyDockerの設定
if command_exists lazydocker; then
  alias lzd='lazydocker'
fi

# miseの設定
if command_exists mise; then
  eval "$(mise activate zsh)"
fi

# AWS CLIの設定
if command_exists aws && command_exists aws_completer; then
  complete -C "$(command -v aws_completer)" aws
fi

# .NET CLIの設定
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")
  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi
  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}
compdef _dotnet_zsh_complete dotnet
