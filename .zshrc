autoload -U promptinit; promptinit
source /usr/share/zsh/share/antigen.zsh
source /usr/share/nvm/init-nvm.sh
source /usr/share/doc/pkgfile/command-not-found.zsh
source ~/scripts/zsh/fzf-git-checkout.zsh
source ~/scripts/zsh/fzf-base16.zsh
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

antigen use oh-my-zsh
antigen bundle git
antigen bundle docker
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle lukechilds/zsh-better-npm-completion

antigen theme refined
antigen apply

HISTSIZE=3000
SAVEHIST=3000
HISTFILE=~/.histfile
EDITOR='nvim'
NODE_OPTIONS=--max_old_space_size=4096

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

alias D='$EDITOR $HOME/.config/dunst/dunstrc'
alias B='$EDITOR $HOME/.config/i3/i3blocks.conf'
alias I='$EDITOR $HOME/.config/i3/config'
alias T='$EDITOR $HOME/.tmux.conf'
alias V='$EDITOR $HOME/.config/nvim/init.vim'
alias X='$EDITOR $HOME/.Xresources'
alias Z='$EDITOR $HOME/.zshrc'
alias back='cd $HOME/dev/gupy-api-darthvader'
alias publ='cd $HOME/dev/gupy-api-darthvader/public-api'
alias front='cd $HOME/dev/gupy-front'
alias pp='cd $HOME/dev/gupy-public-pages'
alias ops='cd $HOME/dev/DevOps-5'
alias mig='cd $HOME/dev/gupy-database-migration'
alias bud='cd $HOME/dev/budget-api'
alias api='back'
alias c='clear'
alias check='git checkout $(git branch | grep -v "*" | fzf)'
alias q='exit'
alias e='exit'
alias g='git'
alias l='ls -lh'
alias mkdir='mkdir -pv'
alias p='ping google.com'
alias s='sudo !!'
alias sz='source $HOME/.zshrc'
alias et='emacs -nw'
alias v='$EDITOR'
alias Z='$EDITOR $HOME/.zshrc'
alias I='$EDITOR $HOME/.config/i3/config'
alias B='$EDITOR $HOME/.config/i3/i3blocks.conf'
alias install='sudo pacman -S --noconfirm'
alias update='yay -Syy'
alias upgrade='yay -Syu --answeredit n --answerdiff n --answerclean n'
alias search='yay -Ssy'
alias remove='yay -Rns'
alias yst='cd $HOME && yadm status'
alias yd='cd $HOME && yadm diff'
alias pdf='apvlv'
alias pgcli='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" EDITOR=nvim /usr/bin/pgcli -h localhost -U postgres gupy_development_prod'
alias pgdev='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" EDITOR=nvim /usr/bin/pgcli -h localhost -U postgres gupy_development'
alias pgtest='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" EDITOR=nvim /usr/bin/pgcli -h localhost -U postgres gupy_test'
alias pgbud='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" EDITOR=nvim /usr/bin/pgcli -h localhost -U postgres budget'
alias gupydate='cat $HOME/scripts/gupy/gupy-repos.csv | sed -e "s/,/\t/g" | xargs -L1 $HOME/scripts/gupy/gupydate.sh'

bindkey -v

transset-df --id $WINDOWID .95 > /dev/null

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
