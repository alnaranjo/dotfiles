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

# Use vim as default editor but keep emacs-style zsh bindings
export EDITOR='vim'
bindkey -e

export RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Adds poetry to path
export PATH="$HOME/.local/bin:$PATH"

# Load pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm


# Looad pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="/usr/local/mongo/bin:$PATH"

# XDG setup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

