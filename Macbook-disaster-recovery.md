# List of steps to restore my Macbook to working conditions

## Notes to myself

* Symlink what you can to dotfiles directory

## Recipe

Run those scripts in this order!

```
./restore-mac.sh
sudo ./sudo-restore-mac.sh
```

## Manual changes

* Point iTerm2 settings folder to: `/Users/switowski/workspace/dotfiles/.config/iterm2_profile`
* Point Alfred settings to: `~/Dropbox/Backups/Alfred` (requires Dropbox to be installed!)

## TODO

* How to restore:
  * iTerm2 settings
    * Move my custom made iterm theme to dotfiles folder
  * Karabiner
  * BetterTouchTools
  * Keyboard shortcuts
  * VS Code settings (should be backed up automatically!)
  * Alfred settings, workflows, snippets
