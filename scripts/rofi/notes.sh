#!/bin/bash
tempdir="$(mktemp -d)"
mkfifo "${tempdir}/input"
# tail -f "${tempdir}/input" &
touch "${tempdir}/output.log"
pass=$(rofi -dmenu -p "Password")
echo "tempdir: $tempdir"
cd ~
ccrypt -d secure.txt.cpt <"${tempdir}/input" >"${tempdir}/output.log" 2>&1 &
pid=$!
echo "pid: $pid"
tail --pid=$pid -Fn 1 "${tempdir}/output.log"
echo "waiting"
wait
echo "done."
rm -f "${tempdir}/input" "${tempdir}/output.log"
