BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

autoload -U promptinit; promptinit;
autoload -U edit-command-line

ZSH_CONFIGS=$HOME/.config/zsh

[[ -f $HOME/.profile ]] && source $HOME/.profile
[[ -f $HOME/.zshenv ]] && source $HOME/.zshenv

source /usr/share/zsh/share/antigen.zsh
#source /usr/share/nvm/init-nvm.sh
source ~/scripts/zsh/fzf-git-checkout.zsh
source ~/scripts/zsh/fzf-base16.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

export NVM_LAZY_LOAD=true

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

antigen theme refined
antigen apply

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile

NODE_OPTIONS=--max_old_space_size=4096

FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow-glob "!.git/*"'

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

alias D='$EDITOR $HOME/.config/dunst/dunstrc'
alias B='$EDITOR $HOME/.config/i3/i3blocks.conf'
alias I='$EDITOR $HOME/.config/i3/config'
alias T='$EDITOR $HOME/.tmux.conf'
alias V='$EDITOR -c "cd $HOME/.config/nvim" $HOME/.config/nvim/init.vim'
alias X='$EDITOR $HOME/.Xresources'
alias Z='$EDITOR $HOME/.zshrc'
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
alias P='$EDITOR $HOME/.config/qtile/config.py'
alias update='yay -Syy'
alias upgrade='yay -Syu --answeredit n --answerdiff n --answerclean n'
alias search='yay -Ssy'
alias yst='cd $HOME && yadm status'
alias yd='cd $HOME && yadm diff'
alias pdf='apvlv'
alias st='st -f "Hack:size=10"'
alias tmux='TERM=tmux-256color tmux'

# Git
alias grhh='git reset HEAD --hard'

# Gupy
alias back='cd $HOME/dev/gupy/backend'
alias api='cd $HOME/dev/gupy/backend/interfaces/http/public-api'
alias devops='cd $HOME/dev/DevOps-5'
alias front='cd $HOME/dev/gupy/frontend'
alias pp='cd $HOME/dev/gupy-public-pages'
alias ops='cd $HOME/dev/ops'
alias mig='cd $HOME/dev/gupy/migration'
alias pr='npm run pull-request'

alias pgcli='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" EDITOR=nvim /usr/bin/pgcli -h localhost -U postgres gupy_development_prod'
alias pgdev='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" EDITOR=nvim /usr/bin/pgcli -h localhost -U postgres gupy_development'
alias pgtest='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" EDITOR=nvim /usr/bin/pgcli -h localhost -U postgres gupy_test'
alias pgprod='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" EDITOR=nvim /usr/bin/pgcli'
alias pgbud='PAGER="nvim -R -u ~/.config/nvim/initpg.vim -" EDITOR=nvim /usr/bin/pgcli -h localhost -U postgres budget'
alias gupydate='cat $HOME/scripts/gupy/gupy-repos.csv | sed -e "s/,/\t/g" | xargs -L1 $HOME/scripts/gupy/gupydate.sh'


bindkey -v
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/rodrigo/.nvm/versions/node/v10.14.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/rodrigo/.nvm/versions/node/v10.14.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/rodrigo/.nvm/versions/node/v10.14.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/rodrigo/.nvm/versions/node/v10.14.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
function gi() { curl -sL gitignore.io/api/$@ ;}
#source ~/.cache/yay/rvm/rvm.sh

eval "$RUN"

[[ -f $ZSH_CONFIGS/functions.zsh ]] && source $ZSH_CONFIGS/functions.zsh
