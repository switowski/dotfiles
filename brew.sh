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
#brew install moreutils  # I wasn't really using this

# Python (better to install it before others, like vim)
brew install python

# Install GNU `find`, `locate`, `updatedb`, and `xargs`
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed
brew install wget
brew install vim
brew install grep

brew install git
brew install fish
brew install brew-cask-completion # Fish completion for brew-cask
brew install fzf # Fish doesn't have ctrl+r, so fzf will fix it

################## OTHERS ###################

# brew install thefuck # Type `fuck` to fix last error  # Not used
brew install mtr # mtr - ping & traceroute

# Some nice replacements for existing tools - with colors and written in Rust
# brew install z # 'z' hopping around folders - replaced with zoxide
brew install zoxide # hopping around folders
# brew install exa # Better 'ls' with colors and nice defaults # not really used
brew install bat # Better 'cat' with syntax highlighting
brew install fd # Better 'find' - faster
brew install ripgrep # Better 'grep'
# brew install the_silver_searcher # Better 'grep' - if rg doesn't work # Not used

brew install ncdu # Nice disk usage analyzer
brew install tldr # Gives nice TLDR from man pages
brew install tree  # Tree of folder's structure
brew install trash  # Moves to trash instead of removing completely - use it with "rm" alias
brew install terminal-notifier  # Nice notifications from the terminal

# Process managers
brew install htop # Better top
brew install glances # Nice monitoring tools (better htop)
brew install btop # Like glances but useful in some other situations
brew install ctop # Htop but for docker containers

brew install watchexec # Run commands if something changes in a directory
brew install git-delta # Better git-diff (replaces diff-so-fancy)

brew install litecli # Better SQLite CLI
brew install pgcli # Better PostgreSQL CLI (it will also install postgres!)

# brew install node # This installs `npm` too using the recommended installation method # Replaced with asdf

brew install pyenv
brew install asdf
brew install direnv
# brew install rbenv # Replaced with asdf
# brew install nodenv # Replaced with asdf

brew install starship # Better prompt

# Remove outdated versions from the cellar
brew cleanup
