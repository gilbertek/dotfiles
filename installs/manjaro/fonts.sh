#!/usr/bin/env bash

# Install system fonts

is_installed () {
  package="$1"

  check="$(sudo pacman -Qs "${package}" | grep "local" | grep "${package} ")";
  if [[ -n "${check}" ]]; then
    echo 0;
  else
    echo 1;
  fi
  return
}

install_fonts() {
  fonts="\
    nerd-fonts-fira-code \
    nerd-fonts-hack \
    nerd-fonts-inconsolata \
    nerd-fonts-droid-sans-mono \
    nerd-fonts-jetbrains-mono \
    nerd-fonts-iosevka \
    nerd-fonts-monoid \
  "

  for font in $fonts; do
    if [[ $(is_installed "${font}") == 0 ]]; then
      echo "${font} is already installed."
    else
      pacman -Q $font > /dev/null || yay -S --noconfirm $font
    fi
  done

  if [[ -d $HOME/.fonts ]]; then
    fc-cache -vf
  fi
}

install_fonts
