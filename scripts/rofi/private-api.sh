#!/bin/bash
source ./common.sh

script="@private-api"
task=$1
echo "$script: $task"

cd ~/dev/gupy/backend

function start_api() {
    npm run dev-sync
}

function stop_api() {
    kill_by_port 9420 "$script" "stopped"
}

case "$task" in
    start) start_api ;;
    stop) stop_api ;;
    *) exit 1
esac
