#!/usr/bin/env bash

echo -e "\nInstalling nerd font..."

formulas=(
    font-dejavusansmono-nerd-font-mono
    font-dejavusansmono-nerd-font
    font-firacode-nerd-font
    font-monoid-nerd-font
    font-hack-nerd-font
    font-hasklig-nerd-font
    font-inconsolatago-nerd-font
    font-iosevka-nerd-font
    font-noto-nerd-font
    font-sourcecodepro-nerd-font-mono
)

for formula in "${formulas[@]}"; do
  # https://github.com/caskroom/homebrew-fonts
  if brew cask list $formula >/dev/null 2>&1; then
    echo "$formula already installed... skipping"
  else
    brew tap caskroom/fonts
    brew cask install $formula
  fi
done
