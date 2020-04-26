#!/usr/bin/env bash

set -eo pipefail

release="20200412T033138"

curl -L https://github.com/snoe/clojure-lsp/releases/download/release-${release}/clojure-lsp > ~/.config/lsp/clojure/clojure-lsp
chmod +x ~/.config/lsp/clojure/clojure-lsp
