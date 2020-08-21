#!/bin/sh
source ~/.fehbg
source ~/.profile

# gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK


if ! pgrep -x "sxhkd" > /dev/null; then
  sxhkd -c ~/bin/sxhkdrc &
fi

if ! pgrep -x "dunst" > /dev/null; then
  dunst &
fi
# if ! pgrep -x "unclutter" > /dev/null; then
#   unclutter -b &
# fi
if ! pgrep -x "greenclip" > /dev/null; then
  greenclip daemon &
fi
if ! pgrep -x "compton" > /dev/null; then
  compton -f -b &
fi
if ! pgrep -x "urxvtd" > /dev/null; then
  urxvtd -q -o -f &
fi

source ~/scripts/config-touchpad.sh
xrdb -load ~/.Xresources &
xmodmap ~/.Xmodmap &
setxkbmap br -variant abnt2 -option 'caps:ctrl_modifier' &


if ! pgrep -x "xcape" > /dev/null; then
  xcape -t 200 -e 'Caps_Lock=Escape' &
fi

numlockx on

