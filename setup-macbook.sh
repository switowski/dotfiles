#!/usr/bin/env bash
# This script will setup Macbook with fish
# Go through the file and uncomment parts that you don't want

# Custom functions
fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# Make sure the homebrew is installed:
if ! [ -x "$(command -v brew)" ]; then
  fail "Error: homebrew is not installed. You can install it from here: https://brew.sh"
fi

################################ Install brew packages #######################
./brew.sh
./brew-cask.sh

############################# Install apps from apple store ##################
brew install mas
./mas.sh

############################## Install npm packages ##########################
./npm.sh

####################### Install pip and Python packages ######################
sudo easy_install pip
./pip.sh

########################### Install oh-my-fish and plugins ###################
./fish.sh

############################## Install Vundle for Vim ########################
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]
then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

################################### Symlink stuff ############################
DOTFILES_ROOT="`pwd`"
# Fish symlinks
ln -s "$DOTFILES_ROOT/.config/fish/aliases.fish" "$HOME/.config/fish/aliases.fish"
ln -s "$DOTFILES_ROOT/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -s "$DOTFILES_ROOT/.config/fish/functions.fish" "$HOME/.config/fish/functions.fish"
ln -s "$DOTFILES_ROOT/.config/fish/path.fish" "$HOME/.config/fish/path.fish"
# Git symlinks
ln -s "$DOTFILES_ROOT/git/.gitconfig.symlink" "$HOME/.gitconfig"
ln -s "$DOTFILES_ROOT/git/.gitignore.symlink" "$HOME/.gitignore"
# Other .rc files
ln -s "$DOTFILES_ROOT/.vimrc" "$HOME/.vimrc"
ln -s "$DOTFILES_ROOT/.pryrc" "$HOME/.pryrc"

# TODO: Synchronize Sublime packages
