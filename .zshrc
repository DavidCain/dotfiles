#! /usr/bin/env zsh
#
# Settings that are unique to zsh and cannot be used by bash
#

# ------------------------------------------------------------------- #
# Profiling [1/2]
# ------------------------------------------------------------------- #
[ -v ZSH_PROF ] && zmodload zsh/zprof


source "$HOME/.bash_or_zshrc"


# ------------------------------------------------------------------- #
# Oh-my-zsh
# ------------------------------------------------------------------- #
# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Case-sensitive autocompletion
CASE_SENSITIVE="true"

# Disable marking untracked files # under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Disable verification of insecure directories (drastically speeds up startup)
# See: https://github.com/ohmyzsh/ohmyzsh/blob/de2395c/lib/compfix.zsh#L39-L41
ZSH_DISABLE_COMPFIX="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=()

source "$ZSH/oh-my-zsh.sh"
#
# Use colors I'm familiar with
# TODO (just defer to ZSH_THEME once I find a theme I'm happy with)
export LSCOLORS=ExFxCxDxBxegedabagacad


# ------------------------------------------------------------------- #
# History
# ------------------------------------------------------------------- #
# Don't add comments starting with space to the history.
setopt HIST_IGNORE_SPACE
# Execute history expansion commands (`!!`, `!$`, etc.) immediately, without an extra enter
unsetopt HIST_VERIFY


# ------------------------------------------------------------------- #
# FZF
# ------------------------------------------------------------------- #
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ------------------------------------------------------------------- #
# Direnv
# ------------------------------------------------------------------- #
command_exists direnv && eval "$(direnv hook zsh)"


# ------------------------------------------------------------------- #
# Sourcing related files
# ------------------------------------------------------------------- #
source $HOME/.aliases
[ -f $HOME/.zshrc_untracked  ] && source $HOME/.zshrc_untracked


# ------------------------------------------------------------------- #
# Profiling [2/2]
# ------------------------------------------------------------------- #
[ -v ZSH_PROF ] && zprof
