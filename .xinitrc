# vim:ft=sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap br -variant abnt2 -option caps:escape
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
  xcape -t 200 -e 'Caps_Lock=Escape' &
fi

[[ -f ~/bin/configure-touchpad ]] && ~/bin/configure-touchpad
[[ -f ~/bin/set-wallpaper ]] && ~/bin/set-wallpaper

eval $(ssh-agent)
keychain --absolute --dir "$KEYCHAIN_DIR" ~/.ssh/id_ed25519
[ -f "$KEYCHAIN_DIR/$HOSTNAME-sh" ] && . $KEYCHAIN_DIR/$HOSTNAME-sh 2>/dev/null
[ -f "$KEYCHAIN_DIR/$HOSTNAME-sh-gpg" ] && . "$KEYCHAIN_DIR/$HOSTNAME-sh-gpg" 2>/dev/null

exec qtile
