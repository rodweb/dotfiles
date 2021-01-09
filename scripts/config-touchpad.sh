#!/bin/bash
TOUCHPAD=$(xinput | grep -i -m1 "touchpad" | pcregrep -o1 '=([0-9]+)')
[ -z "$TOUCHPAD" ] && exit
NATURAL=$(xinput list-props $TOUCHPAD | grep -i -m1 "natural" | pcregrep -o1 '\(([0-9]+)\)')
TAP=$(xinput list-props $TOUCHPAD | grep -i -m1 "tap" | pcregrep -o1 '\(([0-9]+)\)')
TAPDRAG=$(xinput list-props $TOUCHPAD | grep -i -m1 "tap.*drag" | pcregrep -o1 '\(([0-9]+)\)')
# natural scrolling
xinput set-prop $TOUCHPAD $NATURAL 1
# tap to clik
xinput set-prop $TOUCHPAD $TAP 1
# stop tap and drag
xinput set-prop $TOUCHPAD $TAPDRAG 0
