# vim: filetype=sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
TOUCHPAD=$(xinput | grep -i "touchpad" | pcregrep -o1 '=([0-9]+)')
NATURAL=$(xinput list-props $TOUCHPAD | grep -i -m1 "natural" | pcregrep -01 '\(([0-9]+)\)')
TAP=$(xinput list-props $TOUCHPAD | grep -i -m1 "tap" | pcregrep -01 '\(([0-9]+)\)')
TAPDRAG=$(xinput list-props $TOUCHPAD | grep -i -m1 "tap.*drag" | pcregrep -01 '\(([0-9]+)\)')
setxkbmap br
# natural scrolling
xinput set-prop $TOUCHPAD $NATURAL 1
# tap to clik
xinput set-prop $TOUCHPAD $TAP 1
# stop tap and drag
xinput set-prop $TOUCHPAD $TAPDRAG 0
# swap capslock escape
# setxkbmap -option "caps:swapescape"
xmodmap ~/.Xmodmap
# gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
