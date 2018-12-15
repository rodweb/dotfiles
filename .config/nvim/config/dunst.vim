augroup AutoReloadDunst
  au!
  au BufWritePost ~/.config/dunst/dunstrc :!killall dunst && { sleep 1; notify-send "Dunst" "Reloaded" } && dunst 2&>1 /dev/null
augroup END

