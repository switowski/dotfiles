# dotfiles

## Installation

In macOS run this:

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

### Manual tweaks

* Setup some custom shortcuts:
  * App Shortcuts -> Finder.app -> Downloads: Change the default shortcut to Shift+Cmd+L, so you can use Cmd+Alt+L for starting screensaver
  * App Shortcuts -> Mail.app -> Mark All Messages as Read: Shift+Cmd+C
  * Services -> General -> Start Screensaver: Cmd+Alt+L
