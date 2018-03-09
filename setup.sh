#!/usr/bin/env bash

set -e

DOTFILE_ROOT="$HOME/dotfiles"

cd "$DOTFILE_ROOT" || return

git pull origin master;

mkdir -p ~/.config/nvim
ln -sfn $DOTFILE_ROOT/nvim/init.vim ~/.config/nvim/init.vim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
nvim +GoInstallBinaries

