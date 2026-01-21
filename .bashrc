# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# history
HISTCONTROL=ignoreboth
HISTSIZE=200000
shopt -s histappend
shopt -s checkwinsize

export EDITOR='nvim'

C_RESET="\[\033[0m\]"
C_PATH="\[\033[38;5;31m\]"
C_RED="\[\033[31m\]"

__bash_prompt() {
  local ec=$?

  local exit_part=""
  if [[ $ec -ne 0 ]]; then
    exit_part="${C_RED}${ec}${C_RESET} "
  fi

  local suffix=">"
  if [[ $EUID -eq 0 ]]; then
    suffix="${C_RED}#${C_RESET}"
  fi

  PS1="${C_RESET}${C_PATH}\w${C_RESET} ${exit_part}${suffix} ${C_RESET}"
}
PROMPT_COMMAND=__bash_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

# programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[[ -r /usr/share/bash-completion/completions/make ]] && . /usr/share/bash-completion/completions/make
[[ -r "${HOME}/.stripe/stripe-completion.bash" ]] && . "${HOME}/.stripe/stripe-completion.bash"
[[ -r "${HOME}/.docker/completions/docker.bash" ]] && . "${HOME}/.docker/completions/docker.bash"

# nvm
export NVM_DIR="${HOME}/.config/nvm"
[[ -s "${NVM_DIR}/nvm.sh" ]] && . "${NVM_DIR}/nvm.sh"
[[ -s "${NVM_DIR}/bash_completion" ]] && . "${NVM_DIR}/bash_completion"

# go
export GOPATH="${HOME}/.local/share/go"
case ":${PATH}:" in
  *:"${GOPATH}/bin":*) ;;
  *) export PATH="${PATH}:${GOPATH}/bin" ;;
esac
