#!/usr/bin/env bash
# Exit on error
set -e

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

# Install some non-core dependencies/programs
# Use -a parameter to install all packages without confirming

# List of software for apt-get
apt_get_software = (gimp, geany, thunderbird)

if [ "$1" == "-a" ]; then
	for source in ${apt_get_software[@]} do
		sudo apt-get install -y @source
	done
else
	for source in ${apt_get_software[@]} do
		user "Do you want to install $source [y] or [n]"
		read -n 1 action
		case $action in
			y | Y )
				sudo apt-get install -y @source
				;;
			n | N )
				info "Skipping package $source"
				;;
			* )
				;;
		esac
	done
fi

echo "INSTALL: Additional dependencies installed successfully!"