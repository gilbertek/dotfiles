#!/usr/bin/env bash

set -eo pipefail

release="20201224T192019"

curl -L https://github.com/snoe/clojure-lsp/releases/download/release-${release}/clojure-lsp \
  -o ~/.local/bin/clojure-lsp

chmod +x ~/.local/bin/clojure-lsp
