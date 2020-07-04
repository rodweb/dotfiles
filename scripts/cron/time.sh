#!/bin/bash
echo "$(date +%H:%M)" | xargs -ri env DBUS_SESSION_BUS_ADDRESS='unix:path=/run/user/1000/bus' notify-send -u low Time {}
