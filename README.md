dotfiles
========

# INSTALLATION

Run this
```sh
git clone https://github.com/switowski/dotfiles ~/.dotfiles
cd ~/.dotfiles
# Create symlinks and install
chmod +x install.sh
./install.sh
```

### Manual tweaks:
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
