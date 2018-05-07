#!/usr/bin/env bash

set -e

msg() {
  printf '%b\n' "$1" >&2
}

success() {
  if [ "$ret" -eq '0' ]; then
    msg "\\033[32m[✔]\\033[0m ${1}${2}"
  fi
}

warning(){
  msg "\\033[33mWarning:\\033[0m ${1}${2}"
}

error() {
  msg "\\033[31m[✘]\\033[0m ${1}${2}"
  exit 1
}


DOTFILE_ROOT="$HOME/dotfiles"
DOTFILES='functions aliases bash_profile tmux.conf'

cd "$DOTFILE_ROOT" || return

# git pull origin master;
#
# mkdir -p ~/.config/nvim
# ln -sfn "$DOTFILE_ROOT/nvim/init.vim" ~/.config/nvim/init.vim
#
# curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# nvim +PlugInstall +GoInstallBinaries +qall
#
create_link() {
  if [ -e "$1" ]; then
    ln -sf "$1" "$2"
  fi
}

create_symlinks() {
  for file in $DOTFILES; do
    if [ -e "$HOME/.$file" ]; then
      warning ".$file alreadly exists in your home directory. Are you sure to overwrite it? ([y]/n)"
      read -r -n 1;
      msg ""

      if [[ ! $REPLY ]] || [[ $REPLY =~ ^[Yy]$ ]]; then
        create_link "$DOTFILE_ROOT/bash/$file" "$HOME/.$file"
      fi
    else
      ln -s "$DOTFILE_ROOT/$file" "$HOME/.$file"
    fi
  done
}

create_symlinks
ret="$?"
success 'Dotfiles have been configured!'
