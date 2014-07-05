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

###WARNING !!!###
At some point Sublime will get too cluttered so maybe it's better to install clean version of Sublime
and install packages through Package Manager rather than by copying files.

List of packages that I'm using:

**General**
* BracketHighlighter
* FileDiffs
* GitGutter
* Local History
* SideBarEnhancements
* There - Soda
* TrailingSpaces
* Vintageous (not necessary if not working on a laptop)

**Python Development**
* Anaconda

**Rails Development**
* Sass
* ERB Snippets
* SublimeCodeIntel

##RECENTLY DONE:##
* Install sublime
* Set the github username and email during gitconfig symlinking
* Move additional dependencies to the same file as dependencies (why having two files that do the same ?)
* Install imagemagick
* Install package manager, packages and snippets for sublime
* Copy terminator shortcuts

##TODO:##
* Automatic firefox plugins installation
* Export/Import Thunderbird filters: http://askubuntu.com/questions/184288/how-to-export-thunderbird-mail-filters
