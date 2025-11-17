#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export BASH_IT_THEME='barbuk'
source /usr/lib/bash-it-git/bash_it.sh

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
