#!/bin/bash

# install.sh


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR=$HOME/dotfiles_old/
FILES=".bashrc .bash_aliases .inputrc .tmux.conf .hushlogin"

mkdir -p $BACKUP_DIR
pushd $BACKUP_DIR
git init  # Does nothing if already existing
git config user.name "dotfiles installer"
git config user.email "davidjosephcain@gmail.com"
# If global Git config has a signing key, disable it
# (We don't care about signing these commits, and don't want to propmpt for passphrase)
git config commit.gpgsign false
popd

# ---------------------------------------- #
#               Backup stage               #
# ---------------------------------------- #
# First, back up each existing dotfile
# Then replace with a symlink to version-controlled file
# We use the pattern of "copy first, then symlink" (instead of `mv`)
# to always copy _contents_, in case the existing file is a symlink (`mv` preserves symlink)

# Start with normal dotfiles
for file in $FILES; do
    # Copy file, then overwrite it withe a new symlink
    # (Using `mv` doesn't handle the case where the original was a symlink)
    # We want to backup _contents_, not an inode
    cp ~/$file $BACKUP_DIR/
    ln -fsv $DIR/$file ~/$file
done

# Finally, handle ~/.vim (which could be a directory, or a symlinked directory)
if [[ -L $HOME/.vim ]]; then
    # Existing vimfiles are just a symlink
    # We can harmlessly remove the directory without causing data loss
    rm -rf $HOME/.vim
elif [[ -d $HOME/.vim ]]; then
    # The existing ~/.vim is a directory. Back it up!
    rm -rf $BACKUP_DIR/.vim  # (Already committed this revision, if any)
    mv -v $HOME/.vim $BACKUP_DIR/
fi

# Commit the changes (if any).
pushd $BACKUP_DIR
git add -A .
git commit -m "Backup dotfiles"
popd

echo
echo "Old dotfiles archived in $BACKUP_DIR"
echo

# Fetch updates to Vim and Git files (or clone repos, if first load)
cd $DIR
echo "Updating all submodules (vimfiles, gitfiles, etc.)"
git submodule update --init --recursive
cd -

# Configure Vim
ln -fsv $DIR/vimfiles     $HOME/.vim
ln -fsv $HOME/.vim/.vimrc $HOME/.vimrc

# Configure Git
ln -fsv $DIR/gitfiles/.gitconfig_global $HOME/.gitconfig
ln -fsv $DIR/gitfiles/.gitignore_global $HOME/.gitignore
rm $HOME/.git_template  # Remove existing symlink to avoid nesting
ln -fsv $DIR/gitfiles/git_template $HOME/.git_template

vim -c "PlugClean | PlugInstall | qa"
echo "Vim plugins cleaned & installed with vim-plug"

source $HOME/.bashrc
