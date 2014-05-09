#!/usr/bin/env bash
# Exit on error
set -e

echo ''

DOTFILES_ROOT="`pwd`"

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

install_z_script () {
	# https://github.com/rupa/z
	info "Installing z script (https://github.com/rupa/z)"
	echo ''
	cd
	git clone https://github.com/rupa/z.git
	chmod +x ~/z/z.sh
	# also consider moving over your current .z file if possible. it's painful to rebuild :)
	cd $DOTFILES_ROOT
}
if ! [ -d ~/z ]
then
	install_z_script
else
	user "z script already exists. Do you want to replace it [y]es, [n]o ?"
	read -n 1 replace_z_script
	echo ''

	case "$replace_z_script" in
		y | Y )
			info "Removing ~/z directory"
			echo ''
			rm -rf ~/z
			install_z_script;;
		n | N )
			info "Skipping z script"
			;;
		* )
			;;
	esac
fi

echo ''
# Add software HERE
apt_get_software=( vim chromium-browser firefox terminator curl gnome-do sublime-text)

for package in "${apt_get_software[@]}"
do
	info "Installing $package"
	sudo apt-get install -y $package & wait
	echo ''
done

info "---- INSTALL: Finished successfully!"

user "Install additional dependencies ? [y]es, [n]o ?"
read -n 1 additional_deps

case "$additional_deps" in
  y | Y )
	echo ''
	info "---- INSTALL: Installing additional dependencies"
    . ./install-additional-deps.sh
    ;;
  * )
    ;;
esac

info "---- CLEANUP: Running autoremove"
sudo apt-get autoremove -y & wait