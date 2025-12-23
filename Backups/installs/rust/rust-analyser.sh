#!/usr/bin/env bash

set -eo pipefail

# install rust analyzer
if [[ $OSTYPE == "darwin"* ]]; then
   curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-mac \
     -o ~/.local/bin/rust-analyzer
else
  curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux \
    -o ~/.local/bin/rust-analyzer
fi
chmod +x ~/.local/bin/rust-analyzer
