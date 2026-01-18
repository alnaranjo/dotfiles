# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=200000

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

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

export EDITOR='nvim'

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

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# nvm and node init
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin
