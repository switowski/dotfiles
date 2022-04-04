#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install --cask dropbox
brew install --cask vlc
brew install --cask the-unarchiver # Adds unar command
brew install --cask flux
brew install --cask karabiner-elements # karabiner for mapping multiple keys to one
brew install --cask captin # Displays the status of capslock key

brew install --cask iterm2
brew install --cask visual-studio-code

# Image optimizers
brew install --cask imagealpha
brew install --cask imageoptim

# Remove outdated versions from the cellar
brew cask cleanup
