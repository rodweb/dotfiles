# vi:ft=sh
source ~/.profile
# source ~/.fehbg

dunst &
xrdb -load ~/.Xresources &
unclutter -b &
greenclip daemon &
compton -f -b &
urxvtd -q -o -f &
setxkbmap -option 'caps:ctrl_modifier'
xcape -t 200 -e 'Caps_Lock=Escape'
setxkbmap br

# gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# exec i3
# exec awesome
# exec dwm
# exec xmonad
exec qtile
# exec bspwm
# exec startxfce4
