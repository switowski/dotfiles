#!/usr/bin/env bash
# This script will setup Macbook with fish
# Go through the file and uncomment parts that you don't want

# Ask for the administrator password upfront.
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

######################### Install Homebrew and packages ######################
# ./brew.sh
# ./brew-cask.sh

############################# Install apps from apple store ##################
# brew install mas
# ./mas.sh

############################## Install npm packages ##########################
# ./npm.sh

########################### Install fisher plugins ###################
# ./fish.sh

################################### Symlink stuff ############################
################### Always backs up the previous versions if they exist ###########
# Fish symlinks
DOTFILES_ROOT="`pwd`"
cp "$HOME/.config/fish/aliases.fish" "$HOME/.config/fish/aliases.fish_bak" 2>/dev/null
cp "$HOME/.config/fish/config.fish" "$HOME/.config/fish/config.fish_bak" 2>/dev/null
cp "$HOME/.config/fish/functions.fish" "$HOME/.config/fish/functions.fish_bak" 2>/dev/null
cp "$HOME/.config/fish/path.fish" "$HOME/.config/fish/path.fish_bak" 2>/dev/null
cp "$HOME/.config/fish/fish_plugins" "$HOME/.config/fish/fish_plugins.bak" 2>/dev/null
ln -sf "$DOTFILES_ROOT/.config/fish/aliases.fish" "$HOME/.config/fish/aliases.fish"
ln -sf "$DOTFILES_ROOT/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sf "$DOTFILES_ROOT/.config/fish/functions.fish" "$HOME/.config/fish/functions.fish"
ln -sf "$DOTFILES_ROOT/.config/fish/path.fish" "$HOME/.config/fish/path.fish"
ln -sf "$DOTFILES_ROOT/.config/fish/fish_plugins" "$HOME/.config/fish/fish_plugins"

# Git symlinks
cp "$HOME/.gitconfig" "$HOME/.gitconfig_bak" 2>/dev/null
cp "$HOME/.gitignore" "$HOME/.gitignore_bak" 2>/dev/null
ln -sf "$DOTFILES_ROOT/git/.gitconfig.symlink" "$HOME/.gitconfig"
ln -sf "$DOTFILES_ROOT/git/.gitignore.symlink" "$HOME/.gitignore"

# Other .rc files
cp "$HOME/.vimrc" "$HOME/.vimrc_bak" 2>/dev/null
ln -sf "$DOTFILES_ROOT/.vimrc.symlink" "$HOME/.vimrc"

# Starship prompt settings
ln -sf "$DOTFILES_ROOT/.config/starship.toml" "$HOME/.config/starship.toml"

# Symlink karabiner config
ln -sf "$DOTFILES_ROOT/.config/karabiner" "$HOME/.config/karabiner"

####################### Install pip and Python packages ######################
# Pip packages can't be installed manually as the default pip is not the one from pyenv,
# so make sure the pyenv shims are setup first

echo "After you setup the pyenv, run ./pip.sh to install pip packages"

