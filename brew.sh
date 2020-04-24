#!/bin/bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

################## ESSENTIALS ###################

# Install GNU core utilities (those that come with OS X are outdated).
# List of all utils: https://en.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities:
# chronic: runs a command quietly unless it fails
# combine: combine the lines in two files using boolean operations
# errno: look up errno names and descriptions
# ifdata: get network interface info without parsing ifconfig output
# ifne: run a program if the standard input is not empty
# isutf8: check if a file or standard input is utf-8
# lckdo: execute a program with a lock held
# mispipe: pipe two commands, returning the exit status of the first
# parallel: run multiple jobs at once
# pee: tee standard input to pipes
# sponge: soak up standard input and write to a file
# ts: timestamp standard input
# vidir: edit a directory in your text editor
# vipe: insert a text editor into a pipe
# zrun: automatically uncompress arguments to command
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`
brew install findutils --with-default-names

# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Python (better to install it before others, like vim)
brew install python
brew install python3

# Install wget with IRI support (internationalization)
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install vim --with-override-system-vi
brew install nano
brew install grep
#brew install openssh - this fucks up the ssh-agent on mac


brew install git
brew install fish
brew install brew-cask-completion # Fish completion for brew-cask
brew install fzf # Fish doesn't have ctrl+r, so fzf will fix it
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "${RED}You need to add autocomplete and keyboard bindings by hand!: https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew${NC}\n"

################## OTHERS ###################

brew install thefuck # Type `fuck` to fix last error
brew install z # 'z' hopping around folders
brew install mtr # mtr - ping & traceroute. best.
brew install exa # Better 'ls' with colors and nice defaults
brew install bat # Better 'cat' with syntax highlighting
brew install fd # Better 'find' - faster
brew install ripgrep # Better 'grep'
brew install the_silver_searcher # Better 'grep' - if rg doesn't work
brew install ncdu # Nice disk usage analyzer
brew install glances # Nice monitoring tools (better htop)
brew install watchexec # Run commands if something changes in a directory
brew install ctop # Htop but for docker containers

brew install imagemagick --with-webp
brew install node # This installs `npm` too using the recommended installation method
brew install tree
brew install ffmpeg --with-libvpx

# Programming
brew install pyenv
brew install rbenv
brew install nodenv

# Remove outdated versions from the cellar
brew cleanup
