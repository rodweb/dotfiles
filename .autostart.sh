#!/bin/sh
source ~/.fehbg
source ~/.profile

# gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

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

xrdb -load ~/.Xresources &
xmodmap ~/.Xmodmap
setxkbmap -option 'caps:ctrl_modifier'
xcape -t 200 -e 'Caps_Lock=Escape'
setxkbmap br


