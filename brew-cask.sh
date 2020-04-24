#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

# tools
#brew cask install spectacle
brew cask install dropbox
#brew cask install rescuetime
brew cask install vlc
brew cask install the-unarchiver # check the unarchiver page for unar CLI command
brew cask install flux
brew cask install karabiner-elements # karabiner for mapping multiple keys to one
brew cask install menumeters  # Memory/CPU/disk/network menu bars (https://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/)
brew cask install endurance # Extend life on battery (http://enduranceapp.com/)
brew install m-cli # Additional scripts for macOS management (https://github.com/rgcr/m-cli)

# dev
brew cask install iterm2
brew cask install dbcli/litecli # Better SQLite CLI
brew cask install dbcli/pgcli # Better PostgreSQL CLI (it will also install postgres!)
brew cask install podman # Docker replacement

#brew cask install sublime-text
# Image optimizers
brew cask install imagealpha
brew cask install imageoptim

# work related stuff
brew cask install gitter

# Remove outdated versions from the cellar
brew cask cleanup
