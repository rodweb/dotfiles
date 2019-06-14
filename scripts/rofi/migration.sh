#!/bin/bash
task=$1
script="@migration"
echo "$migration: #$task"

function update() {
  if tmux ls | grep -q "migration"; then
    tmux kill-session -t "migration"
  fi
  dir=$(dirname "$0")
  tmux new -d -s "migration" "bash --init-file $dir/update-migrations"
}

case "$task" in
  update)
    update
    ;;
  *)
    exit 1
esac
