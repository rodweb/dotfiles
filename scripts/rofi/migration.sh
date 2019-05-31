#!/bin/bash
task=$1
echo "migration: #$task"

function update() {
    cd ~/dev/gupy/migration
    git stash
    git checkout master
    git pull
    npm start
    npm run migrate-test
    git checkout -
    git stash pop
}

case "$task" in
    update)
        update
        ;;
    *)
        exit 1
esac
