if status is-interactive
  # Commands to run in interactive sessions can go here

  # Temporarily disable creation of pycache files
  set -x PYTHONDONTWRITEBYTECODE 1
  # Disable greeting function
  set -U fish_greeting ""

  set default_user switowski
  set default_machine smbp

  # Set locale to avoid various error messages
  set -x LC_ALL en_US.UTF-8
  set -x LANG en_US.UTF-8

  set -x EDITOR vim

  # Disable installing pip packages outside of virtualenv
  # To override run: PIP_REQUIRE_VIRTUALENV="" pip ...
  set -x PIP_REQUIRE_VIRTUALENV true

  # Disable homebrew analytics
  set -x HOMEBREW_NO_ANALYTICS 1

  # Add brew packages to PATH
  set -x PATH "/opt/homebrew/bin:$PATH"

  # fisher-done settings:
  set -x __done_min_cmd_duration 10000  # set to 10s (default is 5s)

  # Use Docker BuildKit
  set -x COMPOSE_DOCKER_CLI_BUILD 1
  set -x DOCKER_BUILDKIT 1

  # Source startup files
  source ~/.config/fish/path.fish
  source ~/.config/fish/aliases.fish
  source ~/.config/fish/functions.fish

  # for things not checked into git..
  if test -e "$HOME/.extra.fish";
    source ~/.extra.fish
  end

  # Enable virtualfish with some plugins
  # Or find a prompt that supports it
  # This eval slows down vf startup time by 0.4s that's a lot! So instead, I fixed it with a alias vf (see aliases.fish file)
  #eval (~/.pyenv/shims/python -m virtualfish compat_aliases)
  # Read more on virtualfish plugins: http://virtualfish.readthedocs.io/en/latest/plugins.html

  # Store history from all tabs
  history merge
  # History from various tabs is stored in separate sessions, so by default it's not possible to run a command in 1 tab and immediately have access to it in another tab (https://mvolkmann.github.io/fish-article/#CommandHistory).
  # To synchronize history from other tabs, you need to run `history merge`
  # To run the `history merge` command each time you press arrow up to perform history search (that way we don't have to merge after each single command, as discussed here: https://github.com/fish-shell/fish-shell/issues/825) - you need to put the following line in the ./functions/fish_user_key_binding.fish - but it doesn't seem to work :/
  #bind -k up 'history --merge ; up-or-search'

  # zoxide (z replacement)
  zoxide init fish | source

  # Start asdf
  source /opt/homebrew/opt/asdf/libexec/asdf.fish

  # Enable direnv
  direnv hook fish | source

  # Start starship prompt
  starship init fish | source

  # Start pyenv
  pyenv init - | source

  # Created by `pipx` on 2022-04-06 19:51:59
  set PATH $PATH /Users/switowski/.local/bin

  # Setup for Rust
  fish_add_path "$HOME/.cargo/bin"

end

# Non-interactive session
if status is-login
  pyenv init --path | source
end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/switowski/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#eval /Users/switowski/.pyenv/versions/anaconda3-2022.05/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

