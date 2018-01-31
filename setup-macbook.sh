#!/usr/bin/env bash
# This script will setup Macbook with fish
# Go through the file and uncomment parts that you don't want

# Ask for the administrator password upfront.
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

######################### Install Homebrew and packages ######################
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
################### (Backs up the previous versions if they exist) ###########
# Fish symlinks
DOTFILES_ROOT="`pwd`"
cp "$HOME/.config/fish/aliases.fish" "$HOME/.config/fish/aliases.fish_bak" 2>/dev/null
cp "$HOME/.config/fish/config.fish" "$HOME/.config/fish/config.fish_bak" 2>/dev/null
cp "$HOME/.config/fish/functions.fish" "$HOME/.config/fish/functions.fish_bak" 2>/dev/null
cp "$HOME/.config/fish/path.fish" "$HOME/.config/fish/path.fish_bak" 2>/dev/null
ln -sf "$DOTFILES_ROOT/.config/fish/aliases.fish" "$HOME/.config/fish/aliases.fish"
ln -sf "$DOTFILES_ROOT/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sf "$DOTFILES_ROOT/.config/fish/functions.fish" "$HOME/.config/fish/functions.fish"
ln -sf "$DOTFILES_ROOT/.config/fish/path.fish" "$HOME/.config/fish/path.fish"
# Git symlinks
cp "$HOME/.gitconfig" "$HOME/.gitconfig_bak" 2>/dev/null
cp "$HOME/.gitignore" "$HOME/.gitignore_bak" 2>/dev/null
ln -sf "$DOTFILES_ROOT/git/.gitconfig.symlink" "$HOME/.gitconfig"
ln -sf "$DOTFILES_ROOT/git/.gitignore.symlink" "$HOME/.gitignore"
# Other .rc files
cp "$HOME/.vimrc" "$HOME/.vimrc_bak" 2>/dev/null
cp "$HOME/.pryrc" "$HOME/.pryrc_bak" 2>/dev/null
ln -sf "$DOTFILES_ROOT/.vimrc" "$HOME/.vimrc.symlink"
ln -sf "$DOTFILES_ROOT/.pryrc" "$HOME/.pryrc.symlink"

# Backup current Sublime Packages directory and symlink it
if [[ -d "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
 ]]
 cp -R "$HOME/Library/Application Support/Sublime Text 3/Packages/User" "$HOME/Library/Application Support/Sublime Text 3/Packages/User_backup"
then
fi

rm -rf "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
ln -sf "$DOTFILES_ROOT/.config/sublime-text-3-mac/Packages/User" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
