# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fcs() {
  local cs
  cs=$(ls -1 ~/.config/base16-shell/scripts | sed -e 's/\..*$//' | sed -e 's/base16-/base16_/') &&
          eval $(echo $cs | fzf)
}
