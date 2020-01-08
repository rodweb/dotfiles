#!/bin/bash

front=$HOME/dev/gupy-front

i3-msg 'workspace "3: front", layout tabbed'
sleep 0.2
code $front &
sleep 3
urxvt -hold -cd $front &
sleep 0.2
i3-msg 'split h' &
sleep 0.2 &
urxvt -hold -cd $front -e zsh -c "npm start companies" &
