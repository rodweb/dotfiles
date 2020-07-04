#!/bin/bash

CURR=0
NOW=0
CHANGED=0

while true; do
        # ping -c 1 google.com &> /dev/null
        echo -e "GET http://google.com HTTP/1.0\n\n" | nc -w 1 google.com 80 > /dev/null 2>&1
        NOW=$?
        [ "$CURR" != "$NOW" ]
        CHANGED=$?
        echo "Current: $CURR, Now: $NOW, Changed: $CHANGED"
        CURR=$NOW
        if [ $CHANGED -eq 0 ]; then
                if [ $NOW -eq 0 ]; then
                        notify-send "Internet" "Up"
                else
                        notify-send "Internet" "Down"
                fi
        fi
        sleep 5
done
