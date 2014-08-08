#!/usr/bin/env bash
#
# Create symlinks to different files

DOTFILES_ROOT="`pwd`"

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1 \n"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 \n "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

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

function install_fasd () {
  wget --quiet -O /tmp/fasd_master.zip https://github.com/clvv/fasd/archive/master.zip
  unzip -qq /tmp/fasd_master.zip
  cd /tmp/fasd_master/
  sudo make install
  cd DOTFILES_ROOT
  success "Installed FASD"
}

function setup_terminator () {
  # Install terminator config
  link_files_force "$HOME/.config/terminator/config" "$DOTFILES_ROOT/.config/terminator/config.symlinkman"
  success "Linked $HOME/.config/terminator/config to $DOTFILES_ROOT/.config/terminator/config.symlinkman"
}

function setup_sublime () {
  # Setup some sublime preferences
  for file in $DOTFILES_ROOT/.config/sublime-text-3/Packages/User/*; do
    filebasename = $basename( "$f")
    link_files_force "$HOME/.config/sublime-text-3/Packages/User/$filebasename" $file
    success "Linked $HOME/.config/sublime-text-3/Packages/User/$filebasename" $file
  done
  success "Remember to install your favorite sublime plugins listed in README file"
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
  zsh
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    link_files_force "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    # now, we want to add our own config to prezto files. We can do this by appending our configuration to the end of each file
    if [ -f "$DOTFILES_ROOT/.zsh.conf/${rcfile:t}" ]
    then
      cat "$DOTFILES_ROOT/.zsh.conf/${rcfile:t}" >> "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    fi
  done
  chsh -s /bin/zsh # just in case it hasn't been changed before
  # Add my awesome theme
  cp "$DOTFILES_ROOT/.zsh.conf/prompt_awesome_setup" "${ZDOTDIR:-$HOME}"/.zprezto/modules/prompt/functions/

}

function install_program () {
  # Install one program using apt-get
  info "Installing $1"
  sudo apt-get install -y $1 & wait
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

function install_programs () {
  # Installs programs from a list

  # Add software HERE
  apt_get_software=( vim chromium-browser firefox curl gnome-do colordiff )
  confirm "Install programs" "install_packages apt_get_software[@]"
  install_packages apt_get_software[@]

  # Add additional software (additional means you don't want it on every machine) HERE
  # This list can be modified depending on OS and other preferences
  apt_get_additional_software=( terminator imagemagick gimp geany thunderbird nodejs ipython nautilus-dropbox cifs-utils htop )
  confirm "Install additional programs" "install_packages apt_get_additional_software[@]"
}

function confirm () {
  # This functions asks user for confirmation before calling a function
  # Takes two parameters:
  # $1 string with name of action (e.g. "install software")
  # $2 name of functions that will be called if user choose "yes"
  info "---- INSTALL: Do you want to: $1 ? [y]es/[n]o ?"
  read -n 1 call_it
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

}

# Run everything with one command
install