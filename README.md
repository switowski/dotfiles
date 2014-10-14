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
* Theme - Soda
* TrailingSpaces
* Vintageous (not necessary if not working on a laptop)

**Python Development**
* Anaconda

**Rails Development**
* Sass
* ERB Snippets or Ruby Slim (depending on templating engine)
* SublimeCodeIntel

##TODO:##
* Install Vundle with vim
* Add some validators that won't allow to config terminator/sublime if they are not installed (otherwise, the symlinks break)
* Read about antigen (https://github.com/zsh-users/antigen) for zshell plugins management
* Automatic firefox plugins installation
* Export/Import Thunderbird filters: http://askubuntu.com/questions/184288/how-to-export-thunderbird-mail-filters
