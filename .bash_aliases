export DROPBOX='/home/david/Desktop/Dropbox'
export MIT='/home/david/Desktop/Dropbox/MIT'
alias resume='cd $DROPBOX/Documents/Resume'
alias mit='cd $MIT'
alias Anti='cd $MIT/Antibody'
alias anti='cd $MIT/Antibody/antibody'
alias cse='cd $MIT/Antibody/antibody/cse'

alias clc="clear; echo This ain\'t MATLAB, buddeh"

# Classes
alias bio='cd $DROPBOX/Documents/CS441'
alias dev='cd $DROPBOX/Documents/EC335'
alias auc='cd $DROPBOX/Documents/Auctions'
alias lab='cd $DROPBOX/Documents/EC355'

alias today='vim `date --iso-8601`.md'
alias day='today'

alias gimme='sudo apt-get install'
alias supercp='rsync --rsh='ssh' -av --progress --partial' # (source, dest)

alias dj='cd $MIT/Antibody/djweb/antibodyweb'

alias mksl='pandoc -t beamer -s slides.md -V theme:Warsaw -o pres.pdf'
