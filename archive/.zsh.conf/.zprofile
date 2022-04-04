# Set the default Less options.
export LESS='-F -i -R -S -X' # -F exit if one screen, -i ignore case. -R raw ontroll characters, -S chop long lines, -X disable init

#
# Virtualenv
#
# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Add ~/.rbenv/bin to your $PATH for access to the rbenv command-line utility
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
