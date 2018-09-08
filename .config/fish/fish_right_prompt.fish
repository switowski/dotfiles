# Right prompt of my own fish prompt
# See description in fosh_prompt.fish file in the same directory

# Set default value for a variable
function __set_default -S -a var default
  if not set -q $var
    set -g $var $default
  end
end

function available -a name -d "Check if a function or program is available."
  #-a NAMES assigns the value of successive command-line arguments to the names given in NAMES
  type "$name" ^/dev/null >&2
end

########################## SETTINGS ##########################################

# Colors
__set_default color_blue (set_color -o blue)
__set_default color_cyan (set_color -o cyan)
__set_default color_gray (set_color 666)
__set_default color_green (set_color green)
__set_default color_normal (set_color normal)
__set_default color_orange (set_color -o ffb300)
__set_default color_red (set_color -o red)
__set_default color_yellow (set_color -o ffcc00)

__set_default username_color $color_gray
__set_default host_color $color_gray
__set_default root_color $color_normal


function fish_right_prompt
  set -l prompt ""

  set prompt $prompt $color_normal"["

  # Python
  if [ "$VIRTUAL_ENV" != "$LAST_VIRTUAL_ENV" -o -z "$PYTHON_VERSION" ]
    set -gx PYTHON_VERSION (python --version 2>&1 | cut -d\  -f2)
    set -gx LAST_VIRTUAL_ENV $VIRTUAL_ENV
  end

  set prompt $prompt $color_blue$PYTHON_VERSION
   # Show python virtualenv name (if activated)
  if test -n "$VIRTUAL_ENV"
    set prompt $prompt "@"(basename "$VIRTUAL_ENV")
  end

  # Ruby
  set prompt $prompt "$color_gray|$color_red"(rbenv version-name)

  #NVM
  if test -n "$NVM_BIN"
    set node_version (dirname $NVM_BIN | xargs basename | sed 's/^.//') # `nvm current` or `node -v` are slow
    set prompt $prompt "$color_gray|$color_green$node_version"
  end

  set prompt $prompt $color_normal"]"

  echo -e -s $prompt
end
