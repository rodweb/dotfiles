#!/usr/bin/env bash

function list_projects() {
    tmuxinator list | sed -n '1!p' | sed -r 's/\s+/\n/g'
}

action=$(printf "open\nclose\nedit" | rofi -dmenu -p "Project action")

if [[ "$action" == "open" ]];
then
    project=$(list_projects | rofi -dmenu -p "Open project")
    [ "$project" == "" ] && exit 0
    urxvtc -e zsh -i -c "tmuxinator start $project"
fi

if [[ "$action" == "close" ]];
then
    project=$(list_projects | rofi -dmenu -p "Close project")
    [ "$project" == "" ] && exit 0
    urxvtc -e zsh -i -c "tmuxinator stop $project"
fi

if [[ "$action" == "edit" ]];
then
    project=$(list_projects | rofi -dmenu -p "Edit project")
    [ "$project" == "" ] && exit 0
    urxvtc -e zsh -i -c "tmuxinator edit $project"
fi

