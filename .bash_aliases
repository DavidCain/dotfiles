alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias today='vim `date --iso-8601`.md'

alias gimme='sudo apt-get install'
alias supercp='rsync --rsh='ssh' -av --progress --partial' # (source, dest)

alias mksl='pandoc -t beamer -s slides.md -V theme:Warsaw -o pres.pdf'

alias grep="grep --color=always"
function ocr {
    convert $1 ocr_img.tiff
    tesseract ocr_img.tiff ocr_output
    rm -f ocr_img.tiff
}

function pygrep {
    find . -name '*.py' -exec grep -H --color=always "$1" "{}" \;
}
function jsgrep {
    find . -name '*.js' -exec grep -H --color=always "$1" "{}" \;
}

function cdir {
    fn=$1
    if git rev-parse --git-dir > /dev/null 2>&1; then
        fn=${fn#[ab]/}  # Strip Git's leading `a/ or b/`
    fi
    cd `dirname "$fn"`
}

alias fn='find . -name'
alias gg='git g'
# Search everything but unit tests
function gc {
    git g "$@" -- './*' ':!*test.py' ':!*.test.js' ':!**/testing/**'
}

alias gcd='cd "$(git root)"'

alias dn='dirname'

export DROPBOX='/home/david/Dropbox'
alias a='cd "$DROPBOX/MITOC/mitoc-ansible"'
alias m='cd "$DROPBOX/MITOC/mitoc-member"'
alias o='cd "$DROPBOX/MITOC/mitoc-trips"'
alias t='o && cd ws/tests'
alias js='o && cd ws/static/js'
