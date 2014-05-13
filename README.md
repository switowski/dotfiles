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

Sometimes it might be better to install dependencies first,
so first the software is installed by install-deps.sh script
and then the config files are replaced with my files.


TODO:
* Set the github username and email during gitconfig symlinking
* Install sublime, package manager, packages and snippets
* Automatic firefox plugins installation
* Export/Import Thunderbird filters: http://askubuntu.com/questions/184288/how-to-export-thunderbird-mail-filters
* Install imagemagick
* Move additional dependencies to the same file as dependencies (why having two files that do the same ?)