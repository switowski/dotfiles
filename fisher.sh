#!/usr/bin/env fish
# This might fail if fish is not yet installed

# Install fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

echo 'After symlinking fish_plugins folder, run:'
echo (set_color green) '$ fisher update' (set_color normal)
