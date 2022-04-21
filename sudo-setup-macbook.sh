DOTFILES_ROOT="`pwd`"
# Enable crontab that will backup my Evernote notes
ln -sf "$DOTFILES_ROOT/crontab/switowski" "/usr/lib/cron/tabs/switowski"
