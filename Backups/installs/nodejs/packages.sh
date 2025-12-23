#!/usr/bin/env bash

echo -e "\nInstalling npm packages..."

formulas=(
  # leetcode-cli
  neovim
  prettier
  typescript
  eslint
  elm
  elm-test
  elm-format
  percollate
  sass
  browser-sync

  @elm-tooling/elm-language-server
  javascript-typescript-langserver
  ocaml-language-server
  purescript-language-server
)

for formula in "${formulas[@]}"; do
  if npm list -g --depth=0 "$formula" >/dev/null 2>&1; then
    echo "$formula already installed... skipping."
  else
    npm install $formula -g
  fi
done
