# vi:ft=sh
export _JAVA_AWT_WM_NONREPARENTING=1
source ~/.xsession
xrandr --setprovideroutputsource modesetting NVIDIA=0
xrandr --auto
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# exec startdwm
# # exec openbox
exec i3
# exec awesome
#exec startdwm
# exec xmonad
# exec qtile
# exec bspwm
# exec startxfce4
