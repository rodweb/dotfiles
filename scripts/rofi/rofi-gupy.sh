#!/bin/bash

function list_options() {
    printf "vpn\nproject\ngit\nvim"
}

option=$(list_options | sort | ~/scripts/rofi/trofi -dmenu -no-match -p 'Gupy')

cd ~/scripts/rofi

case "$option" in
    git)
        source ./rofi-gupy-git.sh
        ;;
    project)
        source ./rofi-tmuxinator.sh
        ;;
    vpn)
        source ./rofi-vpn.sh
        ;;
    vim)
        source ./rofi-vim-session.sh
        ;;
    *)
        exit 0
esac
