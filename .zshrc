# Uncomment line below (then call `zprof` after running commands) to profile
#zmodload zsh/zprof

# ------------------------------------------------------------------- #
# Oh-my-zsh
# ------------------------------------------------------------------- #
# Path to oh-my-zsh installation
export ZSH="/Users/david/.oh-my-zsh"

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

export HOMEBREW_NO_ANALYTICS=1


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
# Ruby
# ------------------------------------------------------------------- #
# (After `brew install ruby`)
export PATH="/usr/local/opt/ruby/bin:$PATH"
# (After `brew install rbenv`)
command_exists rbenv && eval "$(rbenv init - --no-rehash)"
# After `gem install --user-install`
export PATH="/Users/david/.gem/ruby/2.7.0/bin:$PATH"

# ------------------------------------------------------------------- #
# Python
# ------------------------------------------------------------------- #
export PATH="$HOME/.poetry/bin:$PATH"
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
# To load NVM (rather slow, and generally not needed since I don't do much JS development):
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


# ------------------------------------------------------------------- #
# Git
# ------------------------------------------------------------------- #
command_exists diff-so-fancy && export GIT_PAGER="diff-so-fancy | less --tabs=4 -RFX"


# ------------------------------------------------------------------- #
# Tmux
# ------------------------------------------------------------------- #
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"

# ------------------------------------------------------------------- #
# Direnv
# ------------------------------------------------------------------- #
command_exists direnv && eval "$(direnv hook zsh)"
# Silence the usual messages about `direnv: leading` and `direnv: export`
export DIRENV_LOG_FORMAT=

# Uncomment (and run `zmodload zsh/zprof` at top of file) to profile previous commands
#zprof
