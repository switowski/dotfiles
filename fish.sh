#!/usr/bin/env fish
# This might fail if fish is not yet installed

# Install fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# Install plugins
fisher install foreign-env
fisher install fzf
fisher install nvm
fisher install pyenv
fisher install scorphish

echo "You will probably have to install virtualfish manualy"
fisher install virtualfish

fisher install z

