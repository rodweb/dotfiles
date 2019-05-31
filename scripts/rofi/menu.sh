#!/bin/bash

ROFI_OPTIONS=(-theme $HOME/.config/rofi/rofi_full -m -1 -fullscreen 0 -dmenu -no-match -matching fuzzy -p Task)

function list_options() {
    echo "@migration #update"
    echo "@backend #start"
    echo "@backend #stop"
    echo "@frontend #start-companies"
    echo "@frontend #stop-companies"
    echo "@frontend #start-candidates"
    echo "@frontend #stop-candidates"
    echo "@public-api #start"
    echo "@public-api #stop"
    echo "@private-api #start"
    echo "@private-api #stop"
}

regex="^@([a-z\-]+) #([a-z\-]+)"

option=$(list_options | sort | rofi "${ROFI_OPTIONS[@]}")

if [[ $option =~ $regex ]]
then
    script="${BASH_REMATCH[1]}"
    operation="${BASH_REMATCH[2]}"
    echo "script=$script.sh,operation=$operation"
    "./$script.sh" "$operation"
fi
