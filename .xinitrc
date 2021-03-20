# vim:ft=sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap br -variant abnt2 -option caps:ctrl_modifier -option shift:both_capslock
numlockx on

if ! pgrep -x "sxhkd" > /dev/null; then
  #~/bin/bind &
  sxhkd &
fi
if ! pgrep -x "dunst" > /dev/null; then
  dunst &
fi
if ! pgrep -x "unclutter" > /dev/null; then
  unclutter --fork &
fi
if ! pgrep -x "greenclip" > /dev/null; then
  greenclip daemon &
fi
if ! pgrep -x "picom" > /dev/null; then
  picom --daemon --fading &
fi

if ! pgrep -x "xcape" > /dev/null; then
  xcape -e 'Caps_Lock=Escape' &
fi

[[ -f ~/bin/configure-touchpad ]] && ~/bin/configure-touchpad
[[ -f ~/bin/set-wallpaper ]] && ~/bin/set-wallpaper

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

exec qtile
