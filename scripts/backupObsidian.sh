#!/usr/bin/env sh
# Source: https://medium.com/analytics-vidhya/how-i-put-my-mind-under-version-control-24caea37b8a5

VAULT_PATH="/Users/switowski/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian/"

cd "$VAULT_PATH"

git pull

CHANGES_EXIST="$(git status --porcelain | wc -l)"

if [ "$CHANGES_EXIST" -eq 0 ]; then
	exit 0
fi

git pull
git add .
git commit -q -m "Automatic Sync: $(date +"%Y-%m-%d %H:%M:%S")"
git push -q
