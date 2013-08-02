export DROPBOX='/home/david/Desktop/Dropbox'
export MIT='/home/david/Desktop/Dropbox/MIT'
alias resume='cd $DROPBOX/Documents/Resume'
alias mit='cd $MIT'
alias Anti='cd $MIT/Antibody'
alias anti='cd $MIT/Antibody/antibody'
alias cse='cd $MIT/Antibody/antibody/cse'

alias clc="clear; echo This ain\'t MATLAB, buddeh"

alias today='vim `date --iso-8601`.md'
alias day='today'

alias gimme='sudo apt-get install'
alias supercp='rsync --rsh='ssh' -av --progress --partial' # (source, dest)

alias dj='cd $MIT/djweb/'

alias mksl='pandoc -t beamer -s slides.md -V theme:Warsaw -o pres.pdf'
