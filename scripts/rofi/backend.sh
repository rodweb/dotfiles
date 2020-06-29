#!/bin/bash
script="@backend"
task=$1
echo "$script: #$task"

cd $HOME/dev/gupy-api-darthvader

function start_container() {
    docker-compose up -d
    dunstify "$script" "container started"
}

function stop_container() {
    docker-compose stop
    dunstify "$script" "container stopped"
}

case "$task" in
    start) start_container ;;
    stop) stop_container ;;
    *) exit 1
esac

