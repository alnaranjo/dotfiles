# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# Load stripe completion
fpath=(~/.stripe $fpath)

autoload -Uz compinit && compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst

alias ls='ls -G'
alias pn='pnpm'
alias tx='tmuxinator'

export CLICOLOR=1
export LSCOLORS=cxgxfxexbxegedabagacad
export PROMPT='%F{240}[%m] %F{31}%5~ %(?..%F{red}%?) %(!.%F{red}#.%f>) %f'

# XDG setup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Use vim as default editor but keep emacs-style zsh bindings
export EDITOR='nvim'
bindkey -e

export RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Load nvm and completions
export NVM_DIR="$XDG_CONFIG_HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# Looad pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export GPG_TTY=$(tty)

# Dsiable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

