set default_user "switowski"
set default_machine "smbp"

source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish

# for things not checked into git..
if test -e "$HOME/.extra.fish";
  source ~/.extra.fish
end

# Enable virtualfish with some plugins
# Or find a prompt that supports it
eval (python -m virtualfish compat_aliases)
# Read more on virtualfish plugins: http://virtualfish.readthedocs.io/en/latest/plugins.html

# omf-thefuck is broken, so we need the following line
thefuck --alias | source 

# Store history from all tabs
history --merge

# Enable rbenv
status --is-interactive; and source (rbenv init -|psub)
