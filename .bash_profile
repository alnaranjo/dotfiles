#
# ~/.bash_profile
#
#

# environment for login sessions
[[ -f ~/.profile ]] && . ~/.profile

# interactive shell config
[[ -f ~/.bashrc ]] && . ~/.bashrc

# autostart x on tty1
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
