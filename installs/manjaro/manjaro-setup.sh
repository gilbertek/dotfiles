#!/usr/bin/env bash

# Rank mirrors to set the Fastest Download Servers
sudo pacman-mirrors --fasttrack

# Update
sudo pacman -Syyu

# Tools and Utilities
sudo pacman -Sy albert neovim tmux
sudo pacman -Sy jq htop bat hub

# Memcached
# sudo pacman -S memcached

# Haskell
sudo pacman -Sy stack
sudo pacman -Sy ghc

# Telegram Desktop
# pacman -S telegram-desktop-bin

# PHP
# sudo pacman -S composer
# sudo pacman -S php php-fpm php-apcu php-gd php-imap php-intl php-mcrypt php-memcached php-pgsql php-sqlite php-cgi xdebug

# Nginx
# sudo pacman -S nginx

# MariaDB
# sudo pacman -S mariadb
# sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# sudo pacman -S phpmyadmin

# Redis, Postgresql, SQLite
# sudo pacman -S redis postgresql sqlite
# sudo -u postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'

# Spotify
# yaourt -S spotify

# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.4

# echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
# echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# asdf update

# Install Languages
## Installing Node

# Node requires an extra step:
# bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
# asdf plugin-add nodejs
# asdf list-all nodejs
# asdf install nodejs <version>
# asdf global nodejs <version>

# asdf plugin-add elixir
# asdf list-all elixir
# asdf install elixir <version>
# asdf global elixir <version>


# Visit https://github.com/halcyon/asdf-java for more info
asdf plugin-add java https://github.com/halcyon/asdf-java.git
# asdf list-all java
# asdf install java adopt-openjdk-12.0.2-10.3
# asdf install java adopt-openjdk-13+33
# echo -e '\n. $HOME/.asdf/plugins/java/set-java-home.sh' >> ~/.bashrc

# asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
# ASDF_RUBY_BUILD_VERSION=master asdf install ruby 2.6.4

# Erlang
# Provides most of the needed build tools.
# pacman -S --needed base-devel
# Needed for terminal handling pacman -S ncurses

# For building with wxWidgets (start observer or debugger!) pacman -S glu mesa wxgtk2 libpng

# For building ssl pacman -S libssh

# ODBC support sudo pacman -S unixodbc

# asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
# export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
# asdf list-all erlang
# asdf install erlang <version>