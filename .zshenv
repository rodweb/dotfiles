export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export ASDF_DATA_DIR="$XDG_CONFIG_HOME/asdf"
export ASDF_DIR="/opt/asdf-vm"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f'
export GOPATH="$HOME/dev/go"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/nodejs/repl_history
export SSH_ASKPASS=ssh-askpass
export VISUAL="$EDITOR"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _JAVA_AWT_WM_NONREPARENTING=1
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass"
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"
export HISTSIZE=100000
export SAVEHIST=100000

export PATH="$HOME/bin:$PATH:$GOPATH/bin"
