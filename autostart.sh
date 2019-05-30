#!/bin/bash
setxkbmap -option 'caps:ctrl_modifier'
killall xcape
xcape -t 200 -e 'Caps_Lock=Escape'
setxkbmap br
