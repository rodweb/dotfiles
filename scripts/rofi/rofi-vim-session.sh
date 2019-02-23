#!/bin/bash

function list_sessions() {
    ls ~/*.vim | xargs -n 1 basename
}

session=$(list_sessions | rofi -dmenu -p "Session")

# urxvtc -hold -e nvim -S ~/$session
if [[ "$session" == "" ]];
then
    exit 0
fi

session_path="~/$session"
urxvt -e zsh -i -c "tmux new-session nvim -S $session_path"
