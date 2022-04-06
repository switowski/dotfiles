# dotfiles

I use this repository to store my configuration files and make migrating to a new macbook faster.
`archive` folder contains some old configuration files from the time when I was using Linux and a bunch of other tools that I no longer use.

## How to use it

To set up new Macbook run the following commands:

```sh
git clone https://github.com/switowski/dotfiles ~/.dotfiles
cd ~/.dotfiles
# Go through setup-macbook.sh and comment out what you don't need
chmod +x setup-macbook.sh
chmod +x brew.sh
chmod +x brew-cask.sh
chmod +x mas.sh
chmod +x fish.sh
chmod +x macos-defaults.sh
# Install brew packages, fish, and symlink configuration files
./setup-macbook.sh
# Run commands that require admin privileges
sudo ./sudo-setup-macbook.sh
# Write some better default settings
./macos-defaults.sh
```

## Software that requires manual installation

Some software can't be installed neither with brew nor with mas. Here is a non-exhaustive list:

* [Buho cleaner](https://www.drbuho.com/buhocleaner/download) set of tools to clean up software (like CCleaner from Windows)
* [Logi capture](https://www.logitech.com/en-us/software/capture.html) software for my logitech camera
* [n8n](https://n8n.io) automation tool

## Manual tweaks

* Point iTerm2 settings folder to: `/Users/switowski/workspace/dotfiles/.config/iterm2_profile`
* Point Alfred settings to: `~/Dropbox/Backups/Alfred` (requires Dropbox to be installed!)
* Point BetterTouchTool to use Dropbox for settings synchronziation
  * If this doesn't work, create the following shortcuts:
    * Cmd+H -> A No action (disables the annoying "Hide app" shortcut)
    * Cmd+M -> A No action (disables the annoying "Minimize app" shortcut)
    * Cmd+Shift+W -> Close app under cursor (Consistent behavior for closing any app)

### Shortcuts

* Setup some custom shortcuts:
  * Shortcut for locking screen:
    * App Shortcuts -> Finder.app -> Downloads: Change the default shortcut to Shift+Cmd+L, so you can use Cmd+Alt+L for starting screensaver (see below)
    * App Shortcuts -> "+" -> Application: "All Applications"; Menu title: "Lock Screen" -> Cmd+Alt+L
* Accessibility -> Invert colors -> Cmd+Q (to prevent closing everything when I fat-finger Q instead of W)

### Email accounts

They should synchronize from iCloud and you only need to enable them in the accounts (Mail -> Accounts), but if they don't, here are some tips:

* Gmail and Yahoo are straightforward and using their corresponding setup wizard will do the trick.
* For Zoho, here are the necessary settings (it was a bit problematic to get them right in the first place):
  * IMAP/SMTP Username: firstname@mydomain.com
  * IMAP host name: imappro.zoho.com
  * SMTP host name: smtppro.zoho.com

### Alfred workflows

Go through all the workflows (just try to run them) and set them up. Some will requires setting up API tokens, like Todoist or Gist.

### Virtualfish

Follow instructions from [this comment](https://github.com/asdf-vm/asdf/issues/636#issuecomment-674092994) to set up virtual fish with asdf:

```sh
python -m pip install virtualfish
asdf reshim python
vf install compat_aliases projects environment update_python && exec fish
mkdir $WORKON_HOME
```

### Apple Music

There is a bug that changes the volume after you resume playback. You set the volume in Music to less than full, you start playing a song and the volume starts at full blast only to lower 1 second later.
To prevent this from happening, open preferences, check the "Loseless audio" and choose "Losseless" for Streaming and Download options.

## Troubleshooting

`troubleshooting.sh` contains software and tweaks to troubleshoot some issues. The might not be necessary right away on a clean macOS installation, but maybe in the future.
