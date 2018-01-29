#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

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

# Remove outdated versions from the cellar
brew cleanup