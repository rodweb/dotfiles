# vim:ft=sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap br -variant abnt2 -option caps:ctrl_modifier -option shift:both_capslock
numlockx on

if command -v nvidia-settings > /dev/null 2>&1; then
  nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
fi

if ! pgrep -x "sxhkd" > /dev/null; then
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
  xcape -e 'Caps_Lock=Escape;Alt_L=Backspace' &
fi

[[ -f ~/bin/configure-touchpad ]] && ~/bin/configure-touchpad
[[ -f ~/bin/set-wallpaper ]] && ~/bin/set-wallpaper
[[ -f ~/.screenlayout/main-home.sh ]] && ~/.screenlayout/main-home.sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# exec qtile
exec ~/bin/run_dwm
