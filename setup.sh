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

OSX=$(test "`uname`" == "Darwin" && echo "x")
LINUX=$(test "`uname`" == "Linux" && echo "x")

DOTFILE_ROOT="$HOME/dotfiles/bash"
DOTFILES='functions aliases bash_profile tmux.conf'

cd "$DOTFILE_ROOT" || return

git pull origin master;

# if empty(glob('~/.vim/autoload/plug.vim'))
# fi
# mkdir -p ~/.config/nvim
# ln -sfn "$DOTFILE_ROOT/nvim/init.vim" ~/.config/nvim/init.vim
#
# curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# nvim +PlugInstall +GoInstallBinaries +qall

has() {
  command -v "$1" > /dev/null 2>&1
}

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
        create_link "$DOTFILE_ROOT/$file" "$HOME/.$file"
      fi
    else
      ln -s "$DOTFILE_ROOT/$file" "$HOME/.$file"
    fi
  done
}

if [ $OSX ]; then
  echo "Executing some OSX specific changes..."
  if ! has brew; then
    echo "Installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew install git bash-completion ctags \
    tmux reattach-to-user-namespace tree wget gnupg \
    openssl pinentry pkg-config bash-completion jsonpp json-c

  brew cask install iterm2 spectacle
fi

if [ $LINUX ]; then
  if has dnf; then
    sudo dnf install -y xclip wget
  fi
fi

create_symlinks
ret="$?"
success "Dotfiles have been configured! Done! 🤘"
