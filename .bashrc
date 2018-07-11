#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

set -o vi

source /usr/share/nvm/init-nvm.sh
source /etc/profile.d/fzf-extras.bash
