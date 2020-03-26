#! /usr/bin/env bash
#
# Settings that are unique to bash and cannot be used by zsh
#

source "$HOME/.bash_or_zshrc"

# ------------------------------------------------------------------- #
# General
# ------------------------------------------------------------------- #
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Enable color support of ls
export CLICOLOR=1


# ------------------------------------------------------------------- #
# Vim
# ------------------------------------------------------------------- #
set -o vi


# ------------------------------------------------------------------- #
# History
# ------------------------------------------------------------------- #
# Don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# Increase history size
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


# ------------------------------------------------------------------- #
# FZF
# ------------------------------------------------------------------- #
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# ------------------------------------------------------------------- #
# Direnv
# ------------------------------------------------------------------- #
command_exists direnv && eval "$(direnv hook bash)"
