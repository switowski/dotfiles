#!/usr/bin/env bash
#
# Create symlinks to different files

DOTFILES_ROOT="`pwd`"

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
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

install_dotfiles () {
  info '---- INSTALL: Installing dotfiles'

  overwrite_all=false
  backup_all=false
  skip_all=false

# Fuck is, symlink .config manually
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
  # Manual stuff

  # Install terminator config
  user "Install terminator config ? [y]es, [n]o ?"
  read -n 1 install_terminator_conf
  case "$install_terminator_conf" in
    y | Y )
      link_files_force "$HOME/.config/terminator/config" "$DOTFILES_ROOT/.config/terminator/config.symlinkman"
      ;;
    n | N )
      success "skipped terminator/config"
      ;;
    * )
      ;;
  esac

  # Install sublime config
  user "Install sublime configs and packages ? [y]es, [n]o ?"
  read -n 1 install_sublime_conf
  case "$install_sublime_conf" in
    y | Y )
      ln -sf "$HOME/.config/sublime-text-3/Installed Packages" "$DOTFILES_ROOT/.config/sublime-text-3/Installed Packages.symlinkman"
      success "linked $HOME/.config/sublime-text-3/Installed Packages to $DOTFILES_ROOT/.config/sublime-text-3/Installed Packages.symlinkman"
      ln -sf "$HOME/.config/sublime-text-3/Packages" "$DOTFILES_ROOT/.config/sublime-text-3/Packages.symlinkman"
      success "linked $HOME/.config/sublime-text-3/Packages to $DOTFILES_ROOT/.config/sublime-text-3/Packages.symlinkman"
      ;;
    n | N )
      success "skipped .config/sublime"
      ;;
    * )
      ;;
  esac
  info '---- INSTALL: Finished installing dotfiles'
}

install_dependencies () {
  # Install some software
  user "Install dependencies ? [y]es, [n]o ?"
  read -n 1 install_deps

  case "$install_deps" in
    y | Y )
      . ./install-deps.sh;;
    * )
      ;;
  esac

  echo ''
  echo '  All installed!'
}


install_dependencies
setup_gitconfig
install_dotfiles