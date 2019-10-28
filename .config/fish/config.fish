set default_user switowski
set default_machine smbp

# Set locale to avoid various error messages
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Prevent opening this fucking Nano
set -x EDITOR vim

source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish

# for things not checked into git..
if test -e "$HOME/.extra.fish";
  source ~/.extra.fish
end

# Enable virtualfish with some plugins
# Or find a prompt that supports it
eval (~/.pyenv/shims/python -m virtualfish compat_aliases)
# Read more on virtualfish plugins: http://virtualfish.readthedocs.io/en/latest/plugins.html

# Store history from all tabs
history merge
# History from various tabs is stored in separate sessions, so by default it's not possible to run a command in 1 tab and immediately have access to it in another tab (https://mvolkmann.github.io/fish-article/#CommandHistory).
# To synchronize history from other tabs, you need to run `history merge`
# To run the `history merge` command each time you press arrow up to perform history search (that way we don't have to merge after each single command, as discussed here: https://github.com/fish-shell/fish-shell/issues/825) - you need to put the following line in the ./functions/fish_user_key_binding.fish - but it doesn't seem to work :/
#bind -k up 'history --merge ; up-or-search'

# Enable rbenv
# I'm using `fisher rbenv` plugin instead of this line to speed up fish startup time
# status --is-interactive; and source (rbenv init -|psub)
# Enable nodenv
# I'm using `fisher nodenv` plugin instead of this line to speed up fish startup time
# status --is-interactive; and source (nodenv init -|psub)


# Probably not used for now

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/switowski/Downloads/google-cloud-sdk/path.fish.inc' ]
#   if type source > /dev/null
#     source '/Users/switowski/Downloads/google-cloud-sdk/path.fish.inc'
#   else
#     . '/Users/switowski/Downloads/google-cloud-sdk/path.fish.inc'
#   end
# end

# # For openssl
# set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

thefuck --alias | source
