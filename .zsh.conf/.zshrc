#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# source some additional config files
# aliases will hopefully overwrite the built-in zsh aliases
for file in ~/.{path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && source "$file"
        done
        unset file

# Show current folder in terminal title
# precmd () {print -Pn "\e]; %~\a"}

# Enable fasd
eval "$(fasd --init auto)"

# For invenio-devscripts
export CFG_INVENIO_SRCDIR="$HOME/src/invenio"
export PATH=$HOME/src/invenio-devscripts:$PATH

# For pipsi
export PATH="$HOME/.local/bin:$PATH"

# added by Anaconda 2.3.0 installer
export PATH="/home/switowsk/anaconda/bin:$PATH"

# Use vim as default EDITOR
export EDITOR='vim'

export NVM_DIR="/home/switowsk/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Fix the Ctrl + arrow to move forward/backward by one word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Add ~/.rbenv/bin to your $PATH for access to the rbenv command-line utility
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
export VIRTUAL_ENV_DISABLE_PROMPT=1
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Add docker-compose completion - I don't think it's actually working
fpath=(~/.zsh/completion $fpath)

# Needed for Java (https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04)
JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre/bin/java"
