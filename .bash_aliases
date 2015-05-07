export DROPBOX='/home/david/Desktop/Dropbox'
export LEDGER_FILE='/home/david/Desktop/Dropbox/finance/david.gnucash'

alias resume='cd $DROPBOX/Documents/Resume'

alias clc="clear; echo This ain\'t MATLAB, buddeh"

alias today='vim `date --iso-8601`.md'
alias day='today'

alias gimme='sudo apt-get install'
alias supercp='rsync --rsh='ssh' -av --progress --partial' # (source, dest)

alias mksl='pandoc -t beamer -s slides.md -V theme:Warsaw -o pres.pdf'

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

alias ca='cd $HOME/cloudpercept/app'
alias be='bundle exec'
