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

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`
brew install findutils --with-default-names
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Python (better to install it before others, like vim)
brew install python
brew install python3

brew install brew-cask-completion

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install vim --with-override-system-vi
brew install nano
brew install grep
brew install openssh

# z hopping around folders
brew install z

# Type `fuck` to fix last error
brew install thefuck

# mtr - ping & traceroute. best.
brew install mtr

brew install git
brew install fish

# Install other useful binaries
brew install the_silver_searcher

brew install imagemagick --with-webp
brew install node # This installs `npm` too using the recommended installation method
brew install tree
brew install ffmpeg --with-libvpx

# Programming
brew install pyenv

# Remove outdated versions from the cellar
brew cleanup
