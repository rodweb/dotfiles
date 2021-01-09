#!/bin/zsh

# util
function mcd() {
  mkdir -p "$1" && cd "$1" || return;
}

function add_sudo() {
  BUFFER="sudo $BUFFER"
  zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

# yadm
function y() {
  if [[ $# -gt 0 ]]; then
    yadm "$@"
  else
    yadm status -s
  fi
}

function cfg () {
  yadm ls-tree --full-tree -r --name-only HEAD ~ | fzf | xargs -I{} nvim  ~/{}
}

function cnd() {
  pushd ~
  yadm ls-files ~ -m | fzf -m | xargs -I{} yadm difftool -y -t meld ~/{}
  popd
}

function cna() {
  pushd ~
  yadm add -p ~/"$(yadm ls-files ~ -m | fzf)"
  popd
}

# yay/pacman
function i() {
  # sudo pacman -S --noconfirm $@ 1>/dev/null
  yay -S --noeditmenu --nodiffmenu --nocleanmenu --noremovemake --noconfirm $@ 1>/dev/null && echo "installed."
}

function u() {
  yay -Rns "$@" --noconfirm 1>/dev/null && echo "uninstalled."
}

function pkgs() {
  pacman -Qteq | grep -E -v "^(xorg|gnome|lx|xfce4|xf86)"
}

unalias gm
function gm() {
  args="$@"
  git commit -m \""$args"\"
}

function ga() {
  git ls-files --modified --other --exclude-standard | fzf --prompt "add: " --print0 --multi | xargs --null --verbose git add
}

function git_commit() {
  if [ -n "$BUFFER" ]; then
    BUFFER="git add -u && git commit -m \"$BUFFER\" && git push origin $(git_current_branch)"
  elif [ -z "$BUFFER" ]; then
    BUFFER="git add -u && git commit -v && git push origin $(git_current_branch)"
  fi
  zle accept-line
}
zle -N git_commit
bindkey "^g" git_commit

# function accept_suggestion() {
#   zle forward-char
#   zle accept-line
# }
# zle -N accept_suggestion
# bindkey "^a" accept_suggestion
