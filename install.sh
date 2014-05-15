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
  ln -s $1 $2
  success "linked $1 to $2"
}

install_dotfiles () {
  info '---- INSTALL: Installing dotfiles'

  overwrite_all=false
  backup_all=false
  skip_all=false

  find $DOTFILES_ROOT -maxdepth 3 -name \*.symlink | while read source
  do
    if echo "$source" | grep -q ".config/"
    then
      config_path=`echo $source | grep -o '\.config/.*' | sed -e 's/.symlink//g'`
      dest="$HOME/$config_path"
    else
      # we need to treat .config folders differently
      dest="$HOME/`basename \"${source%.*}\"`"
    fi
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