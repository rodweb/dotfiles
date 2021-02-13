# vim:fdm=marker
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# this is temporary
source ~/.zshenv

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/fzf/fzf-extras.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
source $ASDF_DIR/lib/asdf.sh

# Lines configured by zsh-newuser-install

setopt autocd
setopt extended_glob
setopt no_match
setopt notify
setopt no_list_ambiguous
setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
unsetopt beep
bindkey -v

zstyle :compinstall filename "$ZDOTDIR/.zshrc"

# source /opt/asdf-vm/asdf.sh
PATH="$PATH:$ASDF_DIR/bin"

fpath=(${ASDF_DIR}/completions $fpath)

direnv() { asdf exec direnv "$@"; }

eval "$(fasd --init auto)"
eval "$(direnv hook zsh)"

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit -d "$ZDOTDIR/.zcompdump"

complete -C '/usr/bin/aws_completer' aws

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^V" edit-command-line
bindkey "^R" fzf-history-widget

# aliases {{{
alias sz="source $ZDOTDIR/.zshrc"
alias j='fasd_cd -d' 
alias v="$EDITOR"
alias V="$EDITOR $XDG_CONFIG_HOME/nvim/init.vim"
alias Z="$EDITOR $ZDOTDIR/.zshrc"
alias T="$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf"

alias ls="ls -1 --color"
alias bat="bat --theme gruvbox"

alias gai='git add -i'
alias gap='git add -p'
alias gau='git add -u'
alias gbc='git checkout -B'
alias gbd='git branch -D'
alias gca='git commit -a'
alias gcm='git commit --amend'
alias gcn='git commit --amend --no-edit'
alias gco='git checkout'
alias gcp='git commit -p'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git pull'
alias glr='git pull -r origin master'
alias gm='git mergetool'
alias gp='git push origin HEAD'
alias gpf='gp -f'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grh='git reset HEAD'
alias gri='git rebase -i'
alias grm='git remote prune origin'
alias grs='git reset HEAD -- .' # reset staged
alias gs='git status -s'

alias pi="sudo pacman -S"
alias pr="sudo pacman -Rns"
alias pu="sudo pacman -Syu"
alias po="sudo pacman -Qtdq | sudo pacman -Rns -"
# }}}

# functions {{{
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short
  fi
}

gbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&

  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# kubectl wrapper
function k() {
  if [[ $# -gt 0 ]]; then
    kubectl "$@"
  else
    kubens --current
  fi
}
# }}}

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh