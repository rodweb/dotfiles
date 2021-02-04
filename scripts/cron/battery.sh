#!/usr/bin/env bash
acpi -b | grep -v 'unavailable' | awk -F, '/Discharging/ { if (int($2) < 20) print $2, $3 }' | xargs -ri env DBUS_SESSION_BUS_ADDRESS='unix:path=/run/user/1000/bus' notify-send Battery {}
