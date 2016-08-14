# system-adjective

Welcome to my Arch laptop setup! Complete with install scripts!

## Installation

### Prerequisites

What will you need? To run the full installation, you will need two things:

1. Arch Linux (this is an Arch Linux setup), OR a 1-ounce can of Torvalds
  Brand Elbow Grease For Ambitious Penguins (see the "On Other Distros"
  section below), AND
2. `sudo` powers

### Process

The scripts in `install/` are designed to both initialize new systems with my
setup, as well as modify / repair existing ones. To have everything in the
system checked over or installed, run the `install/all.sh` script.

The `all.sh` script simply executes the other install scripts in a specific
sequence. You can try running the scripts individually based on what you need,
however they do somewhat depend on each other (for example, `link-dots.sh`
provides `.vimrc`, which is required for `vim.sh` to work).

### What Does It Do?

Running `install/all.sh` will do this:

1. Run `system.sh`, which will...
  1. Install the `base-devel` package group
  2. Install the necessary dependencies for `yaourt`
  3. Install `yaourt`
2. Run `link-dots.sh`, which will symlink the included dotfiles in your home
  directory
3. Run `link-scripts.sh`, which will...
  1. Symlink `/usr/local/sbin` to your home directory
  2. Symlink the included `util/` scripts into that directory
4. Run `link-others.sh`, which will...
  1. Symlink the included `.config` **directories** to `~/.config`
  2. Symlink the included X11 configurations into `/etc/X11/xorg.conf.d`
  3. Anything else that I added on after I write this.
5. Run `resources.sh`, which will install a bunch of packages through `yaourt`
6. Run `bar.sh`, which will install my status bar from GitHub
7. Run `vim.sh`, which will...
  1. Install Vundle.vim from GitHub
  2. Install the plugins specified in `.vimrc`
  3. Link `~/.vim` and `~/.vimrc` for Neovim compatibility
8. Run `zsh.sh`, which will...
  1. Install git flow completion for zsh from GitHub
  2. Set your login shell to zsh

### On Other Distros

Though it's meant for Arch Linux, this setup is absolutely possible on other
Linux distributions as well! If you aren't on Arch, take a look at the list of
packages in `install/resources.sh`. If you track down and install the same
packages on your distribution, the rest of the installation (that is, all of
the scripts in `all.sh` minus `system.sh` and `resources.sh`) should work just
fine.

If your system uses a display manager, you'll need to configure it so that it
executes your `~/.xinitrc`. On Arch, this is accomplished by installing the
`xorg-xsession` package; the method on your distro may be different.

## Using The System

I ended up writing a lot about this-- please see USAGE.md.
