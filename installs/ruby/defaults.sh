#!/usr/bin/env bash

gem update
gem sources -l

echo -e "\nInstalling gem packages..."

formulas=(
  tmuxinator
  neovim
  pry
  solargraph
  rubocop
  reek
  rubycritic
  awesome_print
)

for formula in "${formulas[@]}"; do
  if gem list "$formula" >/dev/null 2>&1; then
    echo "$formula already installed... skipping."
  else
    gem install $formula
  fi
done
