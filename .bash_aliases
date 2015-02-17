export DROPBOX='/home/david/Desktop/Dropbox'
export LEDGER_FILE='/home/david/Desktop/Dropbox/finance/david.gnucash'

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
alias hullo='cd $DROPBOX/Hullo'
alias android='cd $DROPBOX/Reading/Android'

function ocr {
    convert $1 ocr_img.tiff
    tesseract ocr_img.tiff ocr_output
    rm -f ocr_img.tiff
}

function pygrep {
    find . -name '*.py' -exec grep -H --color=always "$1" "{}" \;
}
function rbgrep {
    find . -name '*.rb' -exec grep -H --color=always "$1" "{}" \;
}
alias pyinst='python setup.py install --user'
