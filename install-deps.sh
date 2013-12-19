#!/usr/bin/env bash
# Exit on error
set -e

# https://github.com/rupa/z
echo "Installing z script (https://github.com/rupa/z)"
cd
git clone https://github.com/rupa/z.git
chmod +x ~/z/z.sh
# also consider moving over your current .z file if possible. it's painful to rebuild :)

echo "Installing vim"
sudo apt-get install -y vim

echo "Installing chromium"
sudo apt-get install -y chromium-browser

echo "Installing firefox (should be already installed)"
sudo apt-get install -y firefox

echo "Installing terminator"
sudo apt-get install -y terminator

echo "Installing curl"
sudo apt-get install -y curl

echo "Installing gnome-do"
sudo apt-get install -y gnome-do

echo "Installing "
sudo apt-get install -y

echo "Installing "
sudo apt-get install -y


echo "---- INSTALL: Finished successfully!"

case "$1" in
  a | A )
	echo "Installing additional dependencies"
    . install-additional-deps.sh
    ;;
  * )
    ;;
esac

echo "---- CLEANUP: Running autoremove"
sudo apt-get autoremove -y



# Run all dotfiles installers.

# cd "$(dirname $0)"/..

# find the installers and run them iteratively
# find . -name install.sh | while read installer ; do sh -c "${installer}" ; done