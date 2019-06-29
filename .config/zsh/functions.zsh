# util
function mcd() {
  mkdir -p "$1" && cd "$1";
}

function up_dir() {
  BUFFER=".."
  zle accept-line
}
zle -N up_dir
bindkey "^k" up_dir

function pdfs() {
  fd --type file .pdf ~/docs | fzf | xargs apvlv
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

function cn () {
  yadm ls-tree --full-tree -r --name-only HEAD ~ | fzf | xargs -I{} nvim  ~/{}
}

function cnd() {
  yadm ls-files ~ -m | fzf -m | xargs -I{} yadm difftool -y -t meld ~/{}
}

function cna() {
  yadm add -p ~/$(yadm ls-files ~ -m | fzf)
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
  pacman -Qteq | egrep -v "^(xorg|gnome|lx|xfce4|xf86)"
}

# git
unalias g
function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status -s
  fi
}

unalias gm
function gm() {
  args="$@"
  git commit -m ""$args""
}

unalias ga
function ga() {
  git ls-files --modified --other --exclude-standard | fzf --prompt "add: " --print0 --multi | xargs --null --verbose git add
}

function git_commit() {
  if [ -n "$BUFFER" ]; then
    BUFFER="git add -A && git commit -m \"$BUFFER\" && git push origin $(git_current_branch)"
  elif [ -z "$BUFFER" ]; then
    BUFFER="git add -A && git commit -v && git push $(git_current_branch)"
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
