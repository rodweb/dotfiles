#!/bin/sh
source ~/.fehbg
source ~/.profile

# gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

dunst &
xrdb -load ~/.Xresources &
unclutter -b &
greenclip daemon &
compton -f -b &
urxvtd -q -o -f &
setxkbmap -option 'caps:ctrl_modifier' &
xcape -t 200 -e 'Caps_Lock=Escape' &
setxkbmap br &

