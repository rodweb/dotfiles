#!/bin/bash
script="@public-api"
task=$1
echo "$script: #$task"

cd ~/dev/gupy/backend/interfaces/http/public-api

function start_api() {
    npm start
}

function stop_api() {
    port=5000
    pid=$(lsof -t -i:$port)
    [[ ! -z "$pid" ]] && kill $(ps -o ppid= -p $pid)
    [[ "$?" -eq 0 ]] && dunstify "$script" "stopped"
}

case "$task" in
    start) start_api ;;
    stop) stop_api ;;
    *)
        echo "option not found"
        exit 1
esac
