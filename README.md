dotfiles
========

# INSTALLATION

## For MacOS:
Run this
```sh
git clone https://github.com/switowski/dotfiles ~/.dotfiles
cd ~/.dotfiles
# Go through setup-macbook.sh and comment out what you don't need
chmod +x setup-macbook.sh
chmod +x brew.sh
chmod +x brew-cask.sh
chmod +x mas.sh
chmod +x npm.sh
chmod +x fish.sh
# Install brew packages, fish, oh-my-fish and setup some functions
./setup-macbook.sh
```

### Manual tweaks for Macbook:
* Setup some custom shortcuts:
    - App Shortcuts -> Finder.app -> Downloads: Change the default shortcut to Shift+Cmd+L, so you can use Cmd+Alt+L for starting screensaver
    - App Shortcuts -> Mail.app -> Mark All Messages as Read: Shift+Cmd+C
    - Services -> General -> Open Iterm2: Cmd+Alt+T
    - Services -> General -> Start Screensaver: Cmd+Alt+L


## For Linux:
Run this
```sh
git clone https://github.com/switowski/dotfiles ~/.dotfiles
cd ~/.dotfiles
# Create symlinks and install packages
chmod +x setup-linux.sh
./setup-linux.sh
```

### Manual tweaks for Linux:
* Map Caps Lock to Esc (http://berk.es/2012/06/21/map-capslock-to-escape-in-ubuntu-linux/)
* Install AutoKey - a text expander (http://losingit.me.uk/2008/12/26/autokey-nifty-text-expander-for-linux)
* For SublimeLinters to work, you need to install some dependencies:
    ```sh
     pip install pydocstyle  # required for SublimeLinter-pydocstyle (basically pep257)
     pip install pep8  # required for SublimeLinter-pep8
     npm install -g jshint  # required for SublimeLinter-jshint
     npm install -g sass-lint  # required for SublimeLinter-contrib-sass-lint
     ```

### TODO:
* Add some validators that won't allow to config terminator/sublime if they are not installed (otherwise, the symlinks break)
* Export/Import Thunderbird filters: http://askubuntu.com/questions/184288/how-to-export-thunderbird-mail-filters
* Add various linters for sublime
* Install pyenv, virtualenv
    + Add https://github.com/concordusapps/pyenv-implict plugin for pyenv (so python2 command will work when Python
