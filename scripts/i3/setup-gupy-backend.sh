#!/bin/bash

backdir='dev/gupy-api-darthvader'
migdir='dev/gupy-database-migration'
npm='/home/rodrigo/.nvm/versions/node/v8.11.3/bin/npm'

code "$backdir"
st -n 'terminal-back' -e zsh -c "cd $backdir; zsh -i" &
st -n 'terminal-docker' -e zsh -c "cd $backdir; docker-compose -f docker-compose-local.yml up" &
st -n 'terminal-api' -e zsh -i -c "cd $backdir; npm run dev-sync;" &
st -n 'terminal-migration' -e zsh -c "cd $migdir; zsh -i;" &
