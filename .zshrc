# zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_CONFIGS=$HOME/.config/zsh
[[ -f $HOME/.profile ]] && source $HOME/.profile
[[ -f $HOME/.zshenv ]] && source $HOME/.zshenv

export _JAVA_AWT_WM_NONREPARENTING=1
export _Z_CMD=j

source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle docker
antigen bundle command-not-found
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle lukechilds/zsh-nvm
antigen bundle aws
antigen bundle zsh-completion
antigen bundle tmux
antigen bundle mfaerevaag/wd
antigen theme romkatv/powerlevel10k
antigen apply

# make kubectl completion lazy
function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi
    command kubectl "$@"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/dotfiles/zsh/index.zsh
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

autoload -U promptinit; promptinit
autoload -U compinit && compinit
autoload bashcompinit && bashcompinit # for aws-cli completion
autoload -U edit-command-line

source ~/dotfiles/zsh/functions/fzf-zsh-completion.sh
bindkey '^A' fzf_completion

source ~/scripts/zsh/fzf-git-checkout.zsh
source ~/scripts/zsh/fzf-base16.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

export NVM_LAZY_LOAD=true
export YADM_COMPATIBILITY=1
# export NODE_OPTIONS=--max_old_space_size=4096
export NODE_OPTIONS=--max_old_space_size=1900
export FZF_DEFAULT_COMMAND='rg --files --hidden'

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.histfile

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

alias iii='setxkbmap br'
alias aaa='setxkbmap br -variant nativo'
alias D='$EDITOR $HOME/.config/dunst/dunstrc'
alias B='$EDITOR $HOME/.config/i3/i3blocks.conf'
alias I='$EDITOR $HOME/.config/i3/config'
alias T='$EDITOR $HOME/.tmux.conf'
alias X='$EDITOR $HOME/.Xresources'
alias Z='$EDITOR $HOME/.zshrc'
alias V='$EDITOR -c "cd $HOME/.config/nvim" $HOME/.config/nvim/init.vim'
alias c='clear'
alias check='git checkout $(git branch | grep -v "*" | fzf)'
alias q='exit'
alias e='exit'
alias l='ls -lh'
alias mkdir='mkdir -pv'
alias p='ping google.com'
alias s='sudo !!'
alias sz='source $HOME/.zshrc'
alias v='$EDITOR'
alias Z='$EDITOR $HOME/.zshrc'
alias I='$EDITOR $HOME/.config/i3/config'
alias B='$EDITOR $HOME/.config/i3/i3blocks.conf'
alias update='yay -Syy'
alias upgrade='yay -Syu --answeredit n --answerdiff n --answerclean n'
alias search='yay -Ssy'
alias yst='cd $HOME && yadm status'
alias yd='cd $HOME && yadm diff'
alias pdf='apvlv'
alias st='st -f "Hack:size=10"'
alias tmux='TERM=tmux-256color tmux'
alias please='while [ $? -ne 0 ] && [ $? -le 130 ]; do eval "$(fc -ln -1)"; done'
alias pgcli='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" ~/.local/bin/pgcli'
alias dpgcli='docker run -it --rm --network gupy-api-darthvader_default dencold/pgcli'

bindkey -v
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

eval "$RUN"

[[ -f $ZSH_CONFIGS/functions.zsh ]] && source $ZSH_CONFIGS/functions.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

#eval $(thefuck --alias --enable-experimental-instant-mode)
# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

complete -C '/usr/bin/aws_completer' aws
