# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export EDITOR=vim

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# enable color support of ls
export CLICOLOR=1

source ~/.bash_aliases

command_exists () {
    type "$1" &> /dev/null ;
}

# enable programmable completion features
if ! shopt -oq posix; then
  if command_exists brew && [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
  elif [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

set -o vi

export LSCOLORS=ExFxCxDxBxegedabagacad

export WS_DJANGO_LOCAL=1
#export OAUTH_JSON_CREDENTIALS='$HOME/oauth_credentials.json'

export GOODREADS_USER_ID=41926065
#export GOODREADS_DEV_KEY='secret'  # See ~/.secrets_and_keys

[ -f ~/.fzf.bash ]             && source ~/.fzf.bash
[ -f $HOME/.cargo/env ]        && source $HOME/.cargo/env
[ -f $HOME/.secrets_and_keys ] && source $HOME/.secrets_and_keys
[ -f $HOME/.bashrc_untracked ] && source $HOME/.bashrc_untracked
export FZF_DEFAULT_COMMAND='rg --files --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="$HOME/.pyenv/bin:$PATH"
command_exists pyenv && eval "$(pyenv init -)"
command_exists pyenv && eval "$(pyenv virtualenv-init -)"

command_exists diff-so-fancy && export GIT_PAGER="diff-so-fancy | less --tabs=4 -RFX"

export GPG_TTY=$(tty)
export PIP_REQUIRE_VIRTUALENV=true
export PIPENV_VENV_IN_PROJECT=1

export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/sbin:$PATH"
