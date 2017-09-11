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
