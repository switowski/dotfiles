#!/usr/bin/env bash
# Load functions
source ./functions.sh

# Create symlinks to different files

DOTFILES_ROOT="`pwd`"

#Get the package installer
#TODO make this better - put it in a function or something
apt=`command -v apt-get`
yum=`command -v yum`
pacman=`command -v pacman`
if [ -n "$apt" ]; then
    INSTALLER='apt-get -y install'
elif [ -n "$yum" ]; then
    INSTALLER='yum -y install'
elif [ -n "$pacman" ]; then
    INSTALLER='pacman -S'
else
    echo "Err: no path to apt-get or yum" >&2;
    exit 1;
fi

#Also we need to find the default downloader
wget=`command -v wget`
curl=`command -v curl`
if [ -n "$wget" ]; then
    DOWNLOADER='wget --quiet -O'
elif [ -n "$curl" ]; then
    DOWNLOADER='curl -s -L -o'
else
    echo "Err: no tool to download" >&2;
    exit 1;
fi

set -e

echo ''

setup_gitconfig () {
  user "Do you want to set up github user name and email ? [y]es or [n]o ?"
  read -n 1 action
  case "$action" in
    y | Y )
      info '---- INSTALL: Setup .gitconfig'
      user ' - What is your github author name?'
      read -e git_authorname

      user ' - What is your github author email?'
      read -e git_authoremail

      sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" git/.gitconfig.symlink.example > git/.gitconfig.symlink

      success '---- INSTALL: .gitconfig setup successful'
      ;;
    * )
      ;;
  esac
}

link_files () {
  # doesn't work with spaces in file paths
  ln -s $1 $2
  success "linked $1 to $2"
}

link_files_force() {
  # doesn't work with spaces in file paths
  ln -sf $1 $2
  success "linked $1 to $2"
}

function install_bashfiles () {
  info '---- INSTALL: Installing bashfiles'

  overwrite_all=false
  backup_all=false
  skip_all=false

  for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
  do
    dest="$HOME/`basename \"${source%.*}\"`"

    if [ -f $dest ] || [ -d $dest ]
    then

      overwrite=false
      backup=false
      skip=false

      if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
      then
        user "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi

      if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
      then
        rm -rf $dest
        success "removed $dest"
      fi

      if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
      then
        mv $dest $dest\.backup
        success "moved $dest to $dest.backup"
      fi

      if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
      then
        link_files $source $dest
      else
        success "skipped $source"
      fi

    else
      link_files $source $dest
    fi
  done
}

function install_vundle () {
  # This function will install Vundle for vim
  if [[ ! -d ~/.vim/bundle/Vundle.vim ]]
  then
      git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi
  # TODO add a message that directory exists
  # Update plugins
  vim +PluginInstall +qall
}

function install_fasd () {
  $DOWNLOADER /tmp/fasd_master.zip https://github.com/clvv/fasd/archive/master.zip
  unzip -qq -o -d /tmp/ /tmp/fasd_master.zip
  cd /tmp/fasd-master/
  sudo make install -s
  cd $DOTFILES_ROOT
  success "Installed FASD"
}

function setup_terminator () {
  # Install terminator config
  # Make dir if doesn't exists
  mkdir -p "$HOME/.config/terminator"
  link_files_force "$DOTFILES_ROOT/.config/terminator/config.symlinkman" "$HOME/.config/terminator/config"
  #success "Linked $HOME/.config/terminator/config to $DOTFILES_ROOT/.config/terminator/config.symlinkman"
}

function setup_i3 () {
  # Setup i3 config
  # Make dir if doesn't exists
  mkdir -p "$HOME/.i3"
  link_files_force "$DOTFILES_ROOT/.config/.i3/config.symlinkman" "$HOME/.i3/config"
}



function setup_autokey () {
  # Create symlinks for my public autokey scripts
  # Make dir if doesn't exists
  mkdir -p "$HOME/.config/autokey/data"
  link_files_force "$DOTFILES_ROOT/.config/autokey/autokey.json.symlink" "$HOME/.config/autokey/autokey.json"
  link_files_force "$DOTFILES_ROOT/.config/autokey/data/Public" "$HOME/.config/autokey/data/"
}

function setup_sublime () {
  # Symlink sublime User preferences to those from dotfiles
  rm -rf "$HOME/.config/sublime-text-3/Packages/User"
  ln -sf $DOTFILES_ROOT/.config/sublime-text-3/Packages/User "$HOME/.config/sublime-text-3/Packages/User"
  success "Linked $HOME/.config/sublime-text-3/Packages/User to $DOTFILES_ROOT/.config/sublime-text-3/Packages/User"
}

function install_fonts () {
  # Copy fonts to proper folder
  mkdir -p $HOME/.local/share/fonts
  cp -R $DOTFILES_ROOT/fonts/* $HOME/.local/share/fonts
  success "Copied $DOTFILES_ROOT/fonts/* to $HOME/.local/share/fonts"
}

function setup_gitconfig () {
  info '---- INSTALL: Setup .gitconfig'
  user ' - What is your github author name?'
  read -e git_authorname

  user ' - What is your github author email?'
  read -e git_authoremail

  sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" git/.gitconfig.symlink.example > git/.gitconfig.symlink

  success '---- INSTALL: .gitconfig setup successful'
}

function install_prezto () {
  # This function will install prezto - zsh framework: https://github.com/sorin-ionescu/prezto
  if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  fi
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/z*
  do
  echo "$DOTFILES_ROOT/.zsh.conf/.$(basename $rcfile)"
  echo "$rcfile"
    link_files_force "$rcfile" "${ZDOTDIR:-$HOME}/.$(basename $rcfile)"
    # now, we want to add our own config to prezto files. We can do this by appending our configuration to the end of each file
    if [ -f "$DOTFILES_ROOT/.zsh.conf/.$(basename $rcfile)" ]
    then
    echo "copying additional config"
      cat "$DOTFILES_ROOT/.zsh.conf/.$(basename $rcfile)" >> "${ZDOTDIR:-$HOME}/.$(basename $rcfile)"
    fi
  done
  chsh -s `which zsh` # just in case it hasn't been changed before
  # Add my awesome theme
  cp "$DOTFILES_ROOT/.zsh.conf/prompt_awesome_setup" "${ZDOTDIR:-$HOME}"/.zprezto/modules/prompt/functions/

}

function install_program () {
  # Install one program using default system installer (so far apt-get or yum)

  info "Installing $1"
  sudo $INSTALLER $1 & wait
}

function install_packages () {
  # Call install_packages with following parameters:
  # $1 parameter: array of packages to be installed
  # $2 parameter: true if you want to install all software without asking user each time if he wants to install this package
  packages=("${!1}")
  install_all=$2
  for package in "${packages[@]}"
  do
    if [ "$install_all" == "true" ]
    then
      install_program ${package}
    else
      user "Do you want to install $package [y]es or [n]o or install [a]ll"
      read -n 1 action
      case $action in
        a | A )
          install_program ${package}
          install_all=true
          ;;
        y | Y )
          install_program ${package}
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
}

function install_sublime () {
  # Install sublime - requires adding GPG key - it will work automatically only if apt-get is available
  # TODO: make it work on other systems
  if [ $INSTALLER = 'apt-get -y install' ]
  then
    $DOWNLOADER -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo $INSTALLER sublime-text
    success "Installed Sublime!"
  else
    info "Not apt-get! Follow instructions on https://www.sublimetext.com/docs/3/linux_repositories.html to install sublime."
  fi
}


function install_programs () {
  # Installs programs from a list

  # Add software HERE
  apt_get_software=( vim chromium-browser firefox curl colordiff autokey-gtk)
  confirm "Install core software: ${apt_get_software[*]}" "install_packages apt_get_software[@]"

  confirm "Install sublime text editor?" "install_sublime"

  # Add additional software (additional means you don't want it on every machine) HERE
  # This list can be modified depending on OS and other preferences
  apt_get_additional_software=( terminator imagemagick gimp geany thunderbird nodejs ipython nautilus-dropbox cifs-utils htop glipper gnome-do )
  # Glipper - it's a copy/paste manager - allows to copy and paste multiple stuff and easily change what is in the clipboard
  confirm "Install additional software: ${apt_get_additional_software[*]}" "install_packages apt_get_additional_software[@]"

}

function confirm () {
  # This functions asks user for confirmation before calling a function
  # Takes two parameters:
  # $1 string with name of action (e.g. "install software")
  # $2 name of functions that will be called if user choose "yes"
  info "---- INSTALL: Do you want to: $1 ? [y]es/[n]o ?"
  read -n 1 call_it
  printf "\n"
  case "$call_it" in
    y | Y )
      $2
    ;;
    n | N )
      success "skipped step: $1"
    ;;
    * )
    ;;
  esac
}

function install () {
  # Start installation
  info "---- INSTALL: Started installation"

  # Install software
  info "---- INSTALL: 1. Install programs"
  confirm "Install programs" install_programs

  # Install zsh
  info "---- INSTALL: 2. Install zsh"
  confirm "Install zsh" "install_program zsh"

  # Replace shell with zsh
  info "---- INSTALL: 2a. Replace your current shell with zsh"
  confirm "Replace your current shell with zsh" "chsh -s `which zsh`"

 # Install prezto - zsh plugin
  info "---- INSTALL: 2b. Install prezto"
  confirm "Install prezto" install_prezto

 # Install bash related files
  info "---- INSTALL: 3. Install bash config files and aliases"
  confirm "Copy bash files (.bashrc, .aliases, etc.)" install_bashfiles

 # Setup gitconfig
  info "---- INSTALL: 4. Setup gitconfig"
  confirm "Setup gitconfig" setup_gitconfig

 # Setup terminator config
  info "---- INSTALL: 5. Setup terminator config"
  confirm "Setup terminator config" setup_terminator

 # Setup sublime
  info "---- INSTALL: 6. Setup sublime"
  confirm "Setup sublime config" setup_sublime

 # Install FASD - something better that "z" script
  info "---- INSTALL: 7. Install FASD"
  confirm "Install FASD" install_fasd

  info "---- INSTALL: 8. Install Vundle for vim if vim is installed"
  # TODO run it only if vim is installed (and maybe dependind on the content of the .vimrc)
  confirm "Install Vundle ?" install_vundle

 # Install custom fonts
  info "---- INSTALL: 9. Install custom fonts"
  confirm "Install custom fonts" install_fonts

 # Setup autokey
  info "---- INSTALL: 10. Setup autokey"
  confirm "Setup autokey" setup_autokey

 # Setup i3
  info "---- INSTALL: 11. Setup i3"
  confirm "Setup i3" setup_i3

  info "---- INSTALL: Finished !"

}

# Run everything with one command
install
