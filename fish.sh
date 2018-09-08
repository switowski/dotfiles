#!/usr/bin/env fish
# This might fail if fish is not yet installed

# Install fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# Install plugins
fisher install foreign-env
fisher install fzf
fisher install nvm
fisher install pyenv
#fisher install scorphish

echo "You will probably have to install virtualfish manualy"
fisher install virtualfish

fisher install z

# Add my own custom theme
mkdir -p ~/.config/fish/functions/
DOTFILES_ROOT="`pwd`"
ln -sf "$DOTFILES_ROOT/config/fish/fish_prompt.fish" "~/.config/fish/functions/fish_prompt.fish"
ln -sf "$DOTFILES_ROOT/config/fish/fish_right_prompt.fish" "~/.config/fish/functions/fish_right_prompt.fish"
