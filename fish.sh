#!/usr/bin/env fish
# This might fail if fish is not yet installed

# Install oh my fish
curl -L https://get.oh-my.fish | fish

# Install plugins
omf install z
#omf install thefuck # Fix previous command with `fuck`
# thefuck is broken in fish (WTF?!), so we initialize it manually in config.fish
omf install extract # No more googling for correct tar command!
omf install brew # Adds brew packages to the PATH
omf install pyenv # Support for pyenv
# omf install rbenv # Enable rbenv - require rbenv to be installed
