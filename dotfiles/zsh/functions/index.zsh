# vim wrapper
function v() {
  if [[ $# -gt 0 ]]; then
    nvim "$@"
  else
    nvim .
  fi
}

# tmux wrapper
function t() {
  if [[ $# -gt 0 ]]; then
    tmux "$@"
  else
    tmux ps
  fi
}

# docker wrapper
function d() {
  if [[ $# -gt 0 ]]; then
    docker "$@"
  else
    docker ps
  fi
}

# docker-compose wrapper
function dc() {
  if [[ $# -gt 0 ]]; then
    docker-compose "$@"
  else
    docker-compose ps
  fi
}

# git wrapper
function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status -s
  fi
}
