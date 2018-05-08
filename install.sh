#!/bin/bash

# install.sh


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR=$HOME/dotfiles_old/
FILES=".bashrc .bash_aliases .inputrc .tmux.conf"

mkdir -p $BACKUP_DIR

# First, backup each existing dotfile
# Then replace with a symlink to version-controlled file
for file in $FILES; do
    # Copy file, then overwrite it withe a new symlink
    # (Using `mv` doesn't handle the case where the original was a symlink)
    # We want to backup _contents_, not an inode
    cp ~/$file $BACKUP_DIR
    ln -fsv $DIR/$file ~/$file
done

echo
echo "Old dotfiles archived in $BACKUP_DIR"
echo

# Fetch updates to Vim and Git files (or clone repos, if first load)
cd $DIR
git submodule update --init --recursive --remote
cd -

# Configure Vim
ln -fsv $DIR/vimfiles     $HOME/.vim
ln -fsv $HOME/.vim/.vimrc $HOME/.vimrc

# Configure Git
ln -fsv $DIR/gitfiles/.gitconfig_global $HOME/.gitconfig
ln -fsv $DIR/gitfiles/.gitignore_global $HOME/.gitignore

vim -c "PlugClean | PlugInstall | qa"
echo "Vim plugins cleaned & installed with vim-plug"
