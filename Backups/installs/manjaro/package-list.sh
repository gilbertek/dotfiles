#!/usr/bin/env bash

pacman -Qq | grep -v "$(pacman -Qqm)" | grep -v yay | grep -v texlive> ~/dotfiles/installs/manjaro/non-aur.txt
pacman -Qqm | grep -v canon | grep -v capt | grep -v cups> ~/dotfiles/installs/manjaro/aur.txt
