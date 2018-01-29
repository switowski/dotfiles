set default_user "switowski"
set default_machine "switowsk-mbp"

source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish
source ~/.config/fish/chpwd.fish
source ~/.config/fish/functions.fish
source ~/.config/fish/chromium.fish

# for things not checked into git..
if test -e "$HOME/.extra.fish";
  source ~/.extra.fish
end
