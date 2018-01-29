#!/usr/bin/env bash
# This script will setup Macbook with fish

# Go through the file and uncomment parts that you don't want

# Load functions
source ./functions.sh

# Make sure the homebrew is installed:
if ! [ -x "$(command -v brew)" ]; then
  fail "Error: homebrew is not installed. You can install it from here: https://brew.sh"
fi

# Install brew packages
./brew.sh
./brew-cask.sh

# Install apps from apple store
brew install mas
./mas.sh

# Install npm packages
./npm.sh

# Install oh-my-fish and plugins
./fish.sh

# Symlink stuff
## Fish symlinks
DOTFILES_ROOT="`pwd`"
ln -s "$DOTFILES_ROOT/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
## Sublime symlink
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin"

