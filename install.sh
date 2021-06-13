#! /usr/bin/env bash
# TODO: This is a really simple installation script that should be cross-platform.
# However, as I start tracking more files, I might consider a more robust dotfile manager.
# One candidate: https://github.com/anishathalye/dotbot

command_exists () {
    type "$1" &> /dev/null ;
}

# Try to make zsh the default shell
if command_exists zsh;
then
    # Make path to zsh a standard shell, if not already.
    grep -Fxq "$(which zsh)" /etc/shells || sudo sh -c 'echo "$(which zsh)" >> /etc/shells'

    # Set zsh to be the default shell, if not already
    [ "$SHELL" = "$(which zsh)" ] || chsh -s "$(which zsh)"

    echo "Configured zsh as the default shell"
else
    echo "zsh not available -- unable to make default shell"
fi

# Add `asdf` (a utility for managing other tool versions)
# (Could instead install with package managers like `pacman` or `brew`, but this is cross-platform)
if [ ! -d "${HOME}/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git "${HOME}/.asdf"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$HOME/dotfiles_old"
FILES=".bashrc .zshrc .bash_or_zshrc .aliases .inputrc .tmux.conf .ctags .hushlogin .alacritty.yml"

if [[ -e "$BACKUP_DIR" ]] && [[ ! -d "$BACKUP_DIR/.git" ]]; then
    echo "Backup directory $BACKUP_DIR already exists and is not a Git repository."
    exit 1
fi

mkdir -p "$BACKUP_DIR"
pushd "$BACKUP_DIR"
git init  # Does nothing if already existing
git config user.name "dotfiles installer"
git config user.email "davidjosephcain@gmail.com"
# If global Git config has a signing key, disable it
# (We don't care about signing these commits, and don't want to prompt for passphrase)
git config commit.gpgsign false
popd


# ---------------------------------------- #
#               Backup stage               #
# ---------------------------------------- #
# First, back up each existing dotfile
# Then replace with a symlink to version-controlled file
# We use the pattern of "copy first, then symlink" (instead of `mv`)
# to always copy _contents_, in case the existing file is a symlink (`mv` preserves symlink)

# Start with diff-so-fancy, which is configured as the Git pager
[[ -f /usr/local/bin/diff-so-fancy ]] && cp /usr/local/bin/diff-so-fancy "$BACKUP_DIR/"
# TODO: `/usr/local/bin` is `root:root` on Linux, this won't work.
ln -fsv "$DIR/diff-so-fancy" /usr/local/bin/diff-so-fancy

# Follow up with normal dotfiles
for file in $FILES; do
    # Copy file, then overwrite it withe a new symlink
    # (Using `mv` doesn't handle the case where the original was a symlink)
    # We want to backup _contents_, not an inode
    cp "$HOME/$file" "$BACKUP_DIR/"
    ln -fsv "$DIR/$file" "$HOME/$file"
done

# Initialize the Tmux plugin manager
mkdir -p "$HOME/.tmux/plugins"
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [[ -L "$TPM_DIR" ]]; then
    # Existing TPM directory is just a symlink
    # We can harmlessly remove the directory without causing data loss
    rm "$TPM_DIR"
elif [[ -d "TPM_DIR" ]]; then
    # The existing TPM is a directory. Back it up!
    rm -rf "$BACKUP_DIR/tpm"  # (Already committed this revision, if any)
    mv -v "$TPM_DIR" "$BACKUP_DIR/"
fi
ln -fsv "$DIR/tpm" "$TPM_DIR"


# Finally, handle ~/.vim (which could be a directory, or a symlinked directory)
VIM_DIR="$HOME/.vim"
if [[ -L "$VIM_DIR" ]]; then
    # Existing vimfiles are just a symlink
    # We can harmlessly remove the directory without causing data loss
    rm "$VIM_DIR"
elif [[ -d "$VIM_DIR" ]]; then
    # The existing ~/.vim is a directory. Back it up!
    rm -rf "$BACKUP_DIR/.vim"  # (Already committed this revision, if any)
    mv -v "$VIM_DIR" "$BACKUP_DIR/"
fi

# Commit the changes (if any).
pushd "$BACKUP_DIR"
git add -A .
git commit -m "Back up dotfiles"
popd

echo
echo "Old dotfiles archived in $BACKUP_DIR"
echo

# Fetch updates to Vim and Git files (or clone repos, if first load)
cd "$DIR"
echo "Updating all submodules (vimfiles, gitfiles, etc.)"
git submodule update --init --recursive
cd -

# Configure Vim
ln -fsv "$DIR/vimfiles"   "$VIM_DIR"
ln -fsv "$VIM_DIR/.vimrc" "$HOME/.vimrc"

# Configure Git
ln -fsv "$DIR/gitfiles/.gitconfig_global" "$HOME/.gitconfig"
ln -fsv "$DIR/gitfiles/.gitignore_global" "$HOME/.gitignore"
rm "$HOME/.git_template"  # Remove existing symlink to avoid nesting
ln -fsv "$DIR/gitfiles/git_template" "$HOME/.git_template"

# Install Tmux plugins (see tpm/docs/changing_plugins_install_dir.md)
"$HOME/.tmux/plugins/tpm/bin/install_plugins"

# Eagerly install Vim plugins
# (note: otherwise handled automatically on first Vim start)
vim -c "PlugClean | PlugInstall | qa"
echo "Vim plugins cleaned & installed with vim-plug"
