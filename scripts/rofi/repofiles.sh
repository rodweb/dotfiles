#!/bin/sh
find ~/dev/gupy-front ~/dev/gupy-api-darthvader \( -name "*.js" -o -name "*.jsx" \) -not -path "*/node_modules/*"
