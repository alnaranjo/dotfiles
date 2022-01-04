# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst

alias ls='ls -G'

export CLICOLOR=1
export LSCOLORS=cxgxfxexbxegedabagacad
export PROMPT='%F{240}[%m] %F{31}%5~ %(?..%F{red}%?) %(!.%F{red}#.%f>) %f'
export EDITOR='vim'

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
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

