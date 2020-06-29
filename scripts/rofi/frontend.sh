#!/bin/bash
source ./common.sh

script="@frontend"
task=$1
echo "$script: #$task"

cd $HOME/dev/gupy-front

function update() {
    git stash
    git checkout master
    git pull
    git checkout -
    git stash pop
}

function start_companies() {
    npm run start-companies
}

function start_candidates() {
    npm run start-candidates
}

function stop_companies() {
    kill_by_port 3000 $script "companies stopped"
}

function stop_candidates() {
    kill_by_port 4000 $script "candidates stopped"
}

case "$task" in
    update) update ;;
    start) start_companies ;;
    stop) stop_companies ;;
    *) exit 1
esac

