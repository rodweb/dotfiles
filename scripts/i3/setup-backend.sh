#!/bin/bash

back=$HOME/dev/gupy-api-darthvader
migration=$HOME/dev/gupy-database-migration

i3-msg 'workspace "2: back", layout tabbed'
sleep 0.2
code $back &
sleep 3
st -e "cd $back" &
sleep 0.2
i3-msg 'split h' &
sleep 0.2
st -e zsh -i "docker-compose -f $back/docker-compose-local.yml up" &
sleep 0.2
i3-msg 'split vertical'
sleep 0.2
st -e zsh -i "cd $back && npm run dev-sync" &
sleep 0.2
st -e zsh -i "cd $migration && npm run init-dev" &
