# Completion paths
fpath=(~/.zsh $fpath)
fpath=(~/.stripe $fpath)
fpath=(~/.docker/completions $fpath)

# git completions via zstyle
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

autoload -Uz compinit && compinit

# VCS info for prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst

alias ls='ls -G'

export CLICOLOR=1
export LSCOLORS=cxgxfxexbxegedabagacad
export PROMPT='%F{31}%5~ %(?..%F{red}%?) %(!.%F{red}#.%f>) %f'

# XDG setup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Use vim as default editor but keep emacs-style zsh bindings
export EDITOR='nvim'
bindkey -e

# export RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%F{240}V
# zstyle ':vcs_info:*' enable git

# Load nvm and completions
export NVM_DIR="$XDG_CONFIG_HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Load pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Load pyenv
export PYENV_ROOT="$XDG_CONFIG_HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(pyenv init - zsh)"

export GPG_TTY=$(tty)

# Dsiable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

