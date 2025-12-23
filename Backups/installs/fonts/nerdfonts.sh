#!/usr/bin/env bash

echo -e "\nInstalling nerd font..."

formulas=(
    nerd-fonts-victor-mono
    font-firacode-nerd-font
    font-iosevka-nerd-font
)

for formula in "${formulas[@]}"; do
  # https://github.com/caskroom/homebrew-fonts
  if brew cask list $formula >/dev/null 2>&1; then
    echo "$formula already installed... skipping"
  else
    brew tap caskroom/cask-fonts
    brew cask install $formula
  fi
done
