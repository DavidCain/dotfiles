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

1. Install critical system-wide packages (TODO: Brewfile for OS X)
   ```bash
   sudo apt install \
     neovim \   # (Or Vim)
     tmux \
   ```
2. Run script:
   ```bash
   ./install.sh
   ```
3. Optionally install extra helpful packages:
   ```bash
   sudo apt install \
     direnv \     # Sourcing `.envrc` files
     gpg \        # Signs Git commits by default
     ripgrep \    # Referenced in vimrc
     shellcheck \
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

## Possibly absent binaries
My rc files are written to minimize assumptions that any given third-party tool
is actually available on the system. For instance, `vim` is assumed to be
available (it's assigned to `$EDITOR`), but `node` is *not* presumed to be
installed.

Any lines that depend on a third-party executable are generally wrapped in a
check to first make sure that the executable is present in `$PATH`. If absent,
the line will silently decline to execute.

For these dotfiles to work best, executables should be installed separately.
Referenced tools include (but are not limited to):

- Build tools:
    - `cargo`
    - `poetry`
- Miscellaneous tools:
    - `direnv`
    - `fzf`
    - `ripgrep`

Other env vars only make sense if a given tool is installed. For instance
`HOMEBREW_NO_ANALYTICS` only makes sense when `Homebrew` is installed. These
values are harmless if the tool is not present (e.g. Linux systems don't care
about `brew`)
