#! /usr/bin/env zsh
#
# Settings that are unique to zsh and cannot be used by bash
#

# ------------------------------------------------------------------- #
# Profiling [1/2]
# ------------------------------------------------------------------- #
# Easy profile option: ZSH_PROF=1 source ~/.zshrc
# Another option:
#
#     $ git clone https://github.com/romkatv/zsh-bench ~/git_repos/zsh-bench
#     $ !$/zsh-bench
[ -v ZSH_PROF ] && zmodload zsh/zprof


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

# Use a simple zcompdump, vs the standard which uses host & zsh version
# https://github.com/ohmyzsh/ohmyzsh/blob/249c708ed3a/oh-my-zsh.sh#L107
ZSH_COMPDUMP="${HOME}/.zcompdump"

# Shave ~300 ms (!!) off startup time by just using cache.
# `oh-my-zsh.sh` invokes a plain `autoload -U compaudit compinit`.
autoload -Uz compinit;
if [ ! -f "${ZSH_COMPDUMP}" ] || [ "$(find "${ZSH_COMPDUMP}" -mtime +1)" ] ; then
    echo "Reloading completions to ${ZSH_COMPDUMP} (should occur at most once daily)"
    # Force deletion to get new mtime
    # Could just as easily use `touch`, but I want proof that this file is actually created/edited.
    [ -f "${ZSH_COMPDUMP}" ] && rm "${ZSH_COMPDUMP}"
    compinit
fi
compinit -C

# Don't execute `.oh-my-zsh/tools/check_for_upgrade.sh`, takes ~60ms
# (I can invoke `omz update` manually whenever)
DISABLE_AUTO_UPDATE="true" source "$ZSH/oh-my-zsh.sh"
source "$HOME/.bash_or_zshrc"

# Use colors I'm familiar with
# TODO (just defer to ZSH_THEME once I find a theme I'm happy with)
export LSCOLORS=ExFxCxDxBxegedabagacad


# ------------------------------------------------------------------- #
# General
# ------------------------------------------------------------------- #
# Vim mode
bindkey -v
export KEYTIMEOUT=1  # 100 ms timeout after ESC, instead of 400ms


# ------------------------------------------------------------------- #
# History
# ------------------------------------------------------------------- #
# Don't add comments starting with space to the history.
setopt HIST_IGNORE_SPACE
# Execute history expansion commands (`!!`, `!$`, etc.) immediately, without an extra enter
unsetopt HIST_VERIFY
# If history needs to be trimmed to add the current command, oldest duplicate is deleted first
setopt HIST_EXPIRE_DUPS_FIRST
# Don't enter duplicate commands into history
setopt HIST_IGNORE_DUPS
# Older duplicates are removed if adding a new duplicate into history
setopt HIST_IGNORE_ALL_DUPS


# ------------------------------------------------------------------- #
# FZF
# ------------------------------------------------------------------- #
# On Homebrew, this is the location of the zsh completion script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# If using the Debian-installed fzf, a separate completion script is distributed.
# See the description in `apt-cache show fzf`
if [ -f  /usr/share/doc/fzf/examples/key-bindings.zsh ]
then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
# The FZF install script (`install --all`) makes this directory
# (I prefer this version of managing FZF, generally)
elif [ -f ~/.fzf/shell/key-bindings.zsh ]
then
    source ~/.fzf/shell/key-bindings.zsh
fi


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
