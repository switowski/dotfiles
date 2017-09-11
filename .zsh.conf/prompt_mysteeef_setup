#
# A theme based on Steve Losh's Extravagant Prompt with vcs_info integration.
#
# Authors:
#   Steve Losh <steve@stevelosh.com>
#   Bart Trojanowski <bart@jukie.net>
#   Brian Carper <brian@carper.ca>
#   steeef <steeef@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Screenshots:
#   http://i.imgur.com/HyRvv.png
#

function prompt_steeef_precmd {
  # Check for untracked files or updated submodules since vcs_info does not.
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    branch_format="(${_prompt_steeef_colors[1]}%b%f%u%c${_prompt_steeef_colors[4]}●%f)"
  else
    branch_format="(${_prompt_steeef_colors[1]}%b%f%u%c)"
  fi

  zstyle ':vcs_info:*:prompt:*' formats "${branch_format}"

  vcs_info 'prompt'

  if (( $+functions[python-info] )); then
    python-info
  fi

  # Set some variables for right prompt
  pyenv_version="$(pyenv version-name)"
  rvm_version="$(rbenv version-name)"

  # Set the virtualenv variable
  if test -z "$VIRTUAL_ENV" ; then
    PYTHON_VIRTUALENV=""
  else
    PYTHON_VIRTUALENV="(`basename \"$VIRTUAL_ENV\"`)"
  fi
}

function prompt_steeef_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  # Load required functions.
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  # Add hook for calling vcs_info before each command.
  add-zsh-hook precmd prompt_steeef_precmd

  # You could use extended color pallete if available...
  # if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
  #   _prompt_steeef_colors=(
  #     "%F{81}"  # Turquoise
  #     "%F{166}" # Orange
  #     "%F{red}" # Purple
  #     "%F{161}" # Hotpink
  #     "%F{118}" # Limegreen
  #     "%F{118}" # Limegreen
  #   )
  # else
  #   _prompt_steeef_colors=(
  #     "%F{blue}"
  #     "%F{yellow}"
  #     "%F{red}"
  #     "%F{red}"
  #     "%F{green}"
  #     "%F{cyan}"
  #   )
  # fi
  # ... but for now I'm happy with standard colors
  _prompt_steeef_colors=(
    "%F{blue}"
    "%F{yellow}"
    "%F{red}"
    "%F{red}"
    "%F{green}"
    "%F{cyan}"
  )
  # Formats:
  #   %b - branchname
  #   %u - unstagedstr (see below)
  #   %c - stagedstr (see below)
  #   %a - action (e.g. rebase-i)
  #   %R - repository path
  #   %S - path in the repository

  # Define things that change here, so they are recomputed
  local branch_format="(${_prompt_steeef_colors[1]}%b%f%u%c)"
  local action_format="(${_prompt_steeef_colors[5]}%a%f)"
  local unstaged_format="${_prompt_steeef_colors[2]}●%f"
  local staged_format="${_prompt_steeef_colors[5]}●%f"

  # Set vcs_info parameters.
  zstyle ':vcs_info:*' enable bzr git hg svn
  zstyle ':vcs_info:*:prompt:*' check-for-changes true
  zstyle ':vcs_info:*:prompt:*' unstagedstr "${unstaged_format}"
  zstyle ':vcs_info:*:prompt:*' stagedstr "${staged_format}"
  zstyle ':vcs_info:*:prompt:*' actionformats "${branch_format}${action_format}"
  zstyle ':vcs_info:*:prompt:*' formats "${branch_format}"
  zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

  # Set python-info parameters.
  # no longer works due to disabling the python zsh module (it was breaking the virtualenvwrapper)
  #zstyle ':prezto:module:python:info:virtualenv' format '(%v)'

  # Define prompts.
  # Formatting explained here: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  PROMPT="
${_prompt_steeef_colors[3]}%n%f at ${_prompt_steeef_colors[2]}%m%f in ${_prompt_steeef_colors[5]}%~%f "'${vcs_info_msg_0_}'"
"'${_prompt_steeef_colors[6]}${PYTHON_VIRTUALENV}%f'"$ "
  # RPROMPT="${pyenv_version}${rvm_version}"
  RPROMPT='(${pyenv_version})(${rvm_version})'
  RPROMPT='${_prompt_steeef_colors[1]}(P:${pyenv_version})(R:${rvm_version})%f'
}

prompt_steeef_setup "$@"

