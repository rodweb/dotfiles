[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# natural scrolling
#xinput set-prop 11 287 1
xinput set-prop 11 289 1
# tap to clik
#xinput set-prop 11 279 1
xinput set-prop 11 281 1
# stop tap and drag
xinput set-prop 11 283 0
# gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
