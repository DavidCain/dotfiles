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

function cdir {
    fn=$1
    if git rev-parse --git-dir > /dev/null 2>&1; then
        fn=${fn#[ab]/}  # Strip Git's leading `a/ or b/`
    fi
    cd `dirname "$fn"`
}

alias pyinst='python setup.py install --user'

alias fn='find . -name'
alias p='cd $HOME/Projects/cht_policy'
alias c='cd $HOME/cloudpercept'
alias cpw='cd $HOME/Projects/cp-workers'
alias ca='cd $HOME/cloudpercept/app'
alias cl='cd $HOME/cloudpercept/lib'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias gg='git g'

alias gcd='cd "$(git root)"'

alias dn='dirname'
alias sl='(head -n 1 server_list && tail -n +2 server_list | sort -k2)'
