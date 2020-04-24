# My own fish prompt, based on:
# https://github.com/rafaelrinaldi/pure (for simple layout)
# https://github.com/oh-my-fish/theme-scorphish (for colors and functions)
#
# Created because I wanted to have a fast prompt (scorphish was not fast)
# with info about pyenv, rbenv, etc. (that scorphish had)

function __parse_current_folder -d "Replace '$HOME' with '~'"
  string replace $HOME '~' $PWD
end

# Uncomment this if you want to change the title in the terminal
# # Set title to current folder and shell name
# function fish_title
#   set -l basename (string replace -r '^.*/' '' -- $PWD)
#   set -l current_folder (__parse_current_folder)
#   set -l command $argv[1]
#   set -l prompt "$basename: $command $symbol_horizontal_bar $_"

#   if test -z "$command"
#     set prompt "$current_folder $symbol_horizontal_bar $_"
#   end

#   echo $prompt
# end

########################## HELPER FUNCTIONS ##################################

# Set default value for a variable
function __set_default -S -a var default
  if not set -q $var
    set -g $var $default
  end
end

function __parse_git_branch -d "Parse current Git branch name"
  command git symbolic-ref --short HEAD ^/dev/null;
    or echo (command git show-ref --head -s --abbrev HEAD)[1]
end


########################## SETTINGS ##########################################

# Deactivate the default virtualenv prompt so that we can add our own
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# Symbols
__set_default symbol_prompt "❯"
__set_default symbol_git_down_arrow "⇣"
__set_default symbol_git_up_arrow "⇡"
__set_default symbol_git_dirty "*"
__set_default symbol_horizontal_bar "—"
__set_default symbol_root \u26a1
__set_default symbol_bgjobs \u2699

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


function pre_prompt
  # Template
  set -l user_and_host ""
  set -l current_folder (__parse_current_folder)
  set -l git_branch_name ""
  set -l git_dirty ""
  set -l git_arrows ""
  set -l command_duration ""
  set -l pre_prompt ""

  # Check if user is in an SSH session
  if [ "$SSH_CONNECTION" != "" ]
    set -l host (hostname -s)
    set -l user (whoami)

    if [ "$user" = "root" ]
      set user "$root_color$user"
    else
      set user "$username_color$user"
    end

    # Format user and host part of prompt
    set user_and_host "$user$color_gray@$host_color$host$color_normal "
  end

  set pre_prompt $pre_prompt $user_and_host

  # Format current folder on prompt output
  set pre_prompt $pre_prompt "$color_cyan$current_folder$color_normal "

  # Exit with code 1 if git is not available
  if not type -fq git
    return 1
  end

  # Check if is on a Git repository
  set -l is_git_repository (command git rev-parse --is-inside-work-tree ^/dev/null)

  if test -n "$is_git_repository"
    set git_branch_name (__parse_git_branch)

    # Check if there are files to commit
    set -l is_git_dirty (command git status --porcelain --ignore-submodules ^/dev/null)

    if test -n "$is_git_dirty"
      set git_dirty $symbol_git_dirty
    end

    # Check if there is an upstream configured
    # command git rev-parse --abbrev-ref '@{upstream}' > /dev/null 2>&1; and set -l has_upstream
    set -l has_upstream (command git rev-parse --abbrev-ref '@{upstream}' ^/dev/null)
    if set -q has_upstream
      command git rev-list --left-right --count 'HEAD...@{upstream}' | read -la git_status

      set -l git_arrow_left $git_status[1]
      set -l git_arrow_right $git_status[2]

      # If arrow is not "0", it means it's dirty
      if test $git_arrow_left != 0
        set git_arrows " $symbol_git_up_arrow"
      end

      if test $git_arrow_right != 0
        set git_arrows " $git_arrows$symbol_git_down_arrow"
      end
    end

    # Format Git prompt output
    set pre_prompt $pre_prompt "<$color_yellow$git_branch_name$color_red$git_dirty$git_arrows$color_normal>"
  end

  echo -e -s $pre_prompt
end

function fish_prompt
  # Print pre-prompt
  pre_prompt

  set -l prompt ""

  # # Check if the user is root
  # if [ (id -u $USER) -eq 0 ]
  #   set prompt $prompt "$symbol_root "
  # end

  # Check if there are some background jobs
  if [ (jobs -l | wc -l) -ne 0 ]
    set prompt $prompt "$symbol_bgjobs  "
  end

  # Save previous exit code
  set -l exit_code $status

  # Set default color symbol to green meaning it's all good!
  set -l color_symbol $color_green

  # Handle previous failed command
  if test $exit_code -ne 0
    # Symbol color is red when previous command fails
    set color_symbol $color_red
  end

  set prompt $prompt "$color_symbol$symbol_prompt$color_normal "

  echo -e -s $prompt
end
