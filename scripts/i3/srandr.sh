#!/bin/sh
case "${SRANDRD_ACTION}" in
  "HDMI1 connected") source /home/rodrigo/.screenlayout/gupy.sh;;
  "HDMI1 disconnected") source /home/rodrigo/.screenlayout/default.sh;;
  *) echo "not found: ${SRANDRD_ACTION}";;
esac

