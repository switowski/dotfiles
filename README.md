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

List of Sublime packages that needs to be installed by hand:

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

##TODO:##
* Install Vundle with vim
* Add some validators that won't allow to config terminator/sublime if they are not installed (otherwise, the symlinks break)
