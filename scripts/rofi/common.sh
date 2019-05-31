#!/bin/bash
function kill_by_port() {
    port="$1"
    title="$2"
    msg="$3"
    pid=$(lsof -t -i:$port)
    [[ ! -z "$pid" ]] && kill $pid
    [[ "$?" -eq 0 ]] && dunstify "$title" "$msg"
}
