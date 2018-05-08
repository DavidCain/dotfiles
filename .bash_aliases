alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export DROPBOX='/home/david/Dropbox'

alias resume='cd $DROPBOX/Documents/Resume'

alias today='vim `date --iso-8601`.md'
alias day='today'

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
alias gg='git g'

alias gcd='cd "$(git root)"'

alias dn='dirname'

if [ "$HOSTNAME" = "lif.domain" ]; then
    alias ws='cd "$DROPBOX/MITOC/WS_Django"'
    alias o=ws
    alias m='cd $DROPBOX/MITOC/mitoc-member'
    alias t='ws && cd ws/tests'
    alias js='ws && cd ws/static/js'
    alias a='cd $HOME/mitoc-ansible'
fi
