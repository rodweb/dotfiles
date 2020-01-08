#!/bin/bash
[ "$(i3-msg '[class="Spotify"] focus')" = '[{"success":true}]' ] || i3-msg exec spotify && sleep 2
playerctl play-pause
