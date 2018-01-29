#!/usr/bin/env bash
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

# Install of-my-fish and plugins
./omf.sh