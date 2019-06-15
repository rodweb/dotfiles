# vi:ft=sh
source ~/.profile

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
