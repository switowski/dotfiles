#!/usr/bin/env bash
# Exit on error
set -e

echo ''

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

install () {
	info "Installing $1"
	sudo apt-get install -y $1 & wait
	echo ''
}
# Install some non-core dependencies/programs

# List of software for apt-get
apt_get_software=(gimp geany thunderbird)

install_all=false

for package in "${apt_get_software[@]}"
do
	if [ "$install_all" == "true" ]
	then
		install $package
	else
		user "Do you want to install $package [y]es or [n]o or install [a]ll"
		read -n 1 action

		echo ''
		case $action in
			a | A )
				install $package
				install_all=true
				;;
			y | Y )
				install $package
				;;
			n | N )
				info "Skipping package $package"
				echo ''
				;;
			* )
				;;
		esac
	fi
done

echo "INSTALL: Additional dependencies installed successfully!"