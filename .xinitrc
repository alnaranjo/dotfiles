#!/bin/sh

xrdb -merge ~/.Xresources

setxkbmap us

# monitor mode
xrandr --output DP-1 --mode 3440x1440 --rate 120

# SSH agent
if ! pgrep -u "$USER" ssh-agent >/dev/null; then
  eval "$(ssh-agent -s)"
fi

# secret service (for org.freedesktop.secrets)
if ! pgrep -u "$USER" -x gnome-keyring-daemon >/dev/null; then
  eval "$(gnome-keyring-daemon --start --components=secrets)"
fi

# wallpaper
[ -x "$HOME/.local/bin/fehbg" ] && "$HOME/.local/bin/fehbg"

# session
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

# picom
picom --backend glx \
    --vsync \
    --use-damage \
    --detect-rounded-corners \
    --detect-client-opacity &

exec i3
