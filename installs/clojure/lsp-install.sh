#!/usr/bin/env bash

set -eo pipefail

release="2021.01.22-13.04.28"

curl -L https://github.com/snoe/clojure-lsp/releases/download/${release}/clojure-lsp \
  -o ~/.local/bin/clojure-lsp

chmod +x ~/.local/bin/clojure-lsp
