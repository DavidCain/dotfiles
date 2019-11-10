# ------------------------------------------------------------------- #
# Oh-my-zsh
# ------------------------------------------------------------------- #
# Path to oh-my-zsh installation
export ZSH="/Users/david/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Disable marking untracked files # under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=()

source $ZSH/oh-my-zsh.sh

# ---------------------------------------------------------------------- #

command_exists () {
    type "$1" &> /dev/null ;
}

# Use colors I'm familiar with
# TODO (just defer to ZSH_THEME once I find a theme I'm happy with)
export LSCOLORS=ExFxCxDxBxegedabagacad

# Always use local env vars when running MITOC trips
# TODO: Use dotenv or similar to manage this. It's already in the Makefile...
export WS_DJANGO_LOCAL=1

export GOODREADS_USER_ID=41926065
export GPG_TTY=$(tty)



# ------------------------------------------------------------------- #
# Sourcing related files
# ------------------------------------------------------------------- #
source $HOME/.zsh_aliases
# Untracked files that should always be sourced
[ -f $HOME/.secrets_and_keys ] && source $HOME/.secrets_and_keys
[ -f $HOME/.zshrc_untracked  ] && source $HOME/.zshrc_untracked


# ------------------------------------------------------------------- #
# Vim
# ------------------------------------------------------------------- #
export EDITOR='vim'
set -o vi


# ------------------------------------------------------------------- #
# History
# ------------------------------------------------------------------- #
# Don't add comments starting with space to the history.
setopt HIST_IGNORE_SPACE
# Execute history expansion commands (`!!`, `!$`, etc.) immediately, without an extra enter
unsetopt HIST_VERIFY

#
# ------------------------------------------------------------------- #
# FZF
# ------------------------------------------------------------------- #
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# ------------------------------------------------------------------- #
# Rust
# ------------------------------------------------------------------- #
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env


# ------------------------------------------------------------------- #
# Python
# ------------------------------------------------------------------- #
export PATH="$HOME/.pyenv/bin:$PATH"
command_exists pyenv && eval "$(pyenv init - --no-rehash)"
command_exists pyenv && eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PIP_REQUIRE_VIRTUALENV=true
export PIPENV_VENV_IN_PROJECT=1


# ------------------------------------------------------------------- #
# JavaScript
# ------------------------------------------------------------------- #
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# ------------------------------------------------------------------- #
# Git
# ------------------------------------------------------------------- #
command_exists diff-so-fancy && export GIT_PAGER="diff-so-fancy | less --tabs=4 -RFX"


# ------------------------------------------------------------------- #
# Tmux
# ------------------------------------------------------------------- #
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"
