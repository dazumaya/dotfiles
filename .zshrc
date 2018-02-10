# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
export JAVA_OPTIONS="-Dfile.encoding=UTF-8"
export JAVA_HOME=$(/usr/libexec/java_home)

## Default shell configuration
#
# set prompt
#
autoload colors
colors

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
# to end of it)
#
bindkey -e

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
#
autoload -U compinit
compinit

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

## terminal configuration
export TERM=xterm-256color
## set terminal title including current directory
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

## history search
function peco-select-history() {
  BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
  CURSOR=$#BUFFER             # カーソルを文末に移動
  zle -R -c                   # refresh
}
zle -N peco-select-history
bindkey '^R' peco-select-history

# source search
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

## zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load
