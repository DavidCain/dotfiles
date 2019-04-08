# About
This repository contains all of my dotfiles. I use a lot of shortcuts/aliases
and a small assortment of Vim plugins. To be productive on a new system, I rely
on these customizations.

This repository is dual-purposed. It version controls all of my environment
changes, but also contains everything I need in order to get up and running
(immediately) on a brand new system.

## Vim/Git
I tinker with my Vim & Git settings a good deal, so the configurations for
each are tracked as submodules:

- [vimfiles](https://github.com/DavidCain/vimfiles)
- [gitfiles](https://github.com/DavidCain/gitfiles)

# Installation
```bash
./install.sh
```

## How installation works
The install script will not remove any existing configuration without backing
it up first.

Specifically, any pre-existing dotfiles (that will be replaced by the files
tracked in this repository) will be copied to `~/dotfiles_old`. Their contents
will be committed to a Git repository, so that successive runs of the
installation script won't miss any new modifications.

After a file/directory has been successfully backed up, it is replaced with a
symlink to its equivalent file within this repository. Any changes within the
repository will be reflected immediately upon sourcing dotfiles. Conversely,
editing dotfiles directly will give the opportunity to stage any changes and
version control them here.
