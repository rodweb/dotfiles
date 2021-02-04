#!/usr/bin/env bash
emulator="/opt/android-sdk/emulator/emulator"
avd=$("$emulator" -list-avds | fzf)
[ "$avd" == "" ] && exit 1
nohup $("$emulator" -avd "$avd") &
