#!/usr/bin/env bash

# Installed in ~/bin because it can change over time and we don't want it cluttering up the dotfiles repo

if [[ ! -a ~/bin/lein ]]; then
	echo "Installing Leiningen"
	curl --output ~/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x ~/bin/lein
	lein version
fi
