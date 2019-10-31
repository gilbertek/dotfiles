#!/usr/bin/env bash

# Rank mirrors to set the Fastest Download Servers
sudo pacman-mirrors --fasttrack

# Update
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm base-devel cmake zlib openssl

install() {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1} ..."
    sudo pacman -S --noconfirm $1
  else
    echo "Already installed: ${1}"
  fi
}

PACKAGES=(
# Tools and Utilities
  albert
  neovim
  tmux
  jq
  htop
  bat
  hub
  fzf
  ctags
  awscli
  chromium-browser
  curl
  clang
  # exfat-utils
  file
  git
  nmap
  openvpn

  xclip
  xsel

  # Samba printer browse & configuration
  manjaro-settings-samba
  libreoffice-fresh
  system-config-printer

  # Image processing
  gimp
  jpegoptim
  optipng

  # Memcached
  memcached

  # Haskell
  stack
  ghc

  # Telegram Desktop
  # telegram-desktop-bin
)

for package in ${PACKAGES[@]}; do
  install $package
done

# PHP
sudo pacman -S composer
sudo pacman -S php php-fpm php-apcu php-gd php-imap php-intl php-mcrypt php-memcached php-pgsql php-sqlite php-cgi xdebug

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

echo "==> Install ASDF and plugins"
if [ ! -d "$HOME/.asdf" ]; then
    echo "===> Installing ASDF"
    git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.7.4

    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
fi

source "$HOME/.asdf/asdf.sh"

if [ ! -d "$ASDF_DIR/plugins/erlang" ]; then
    echo "===> Installing ASDF erlang plugin"
    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
    export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
# asdf list-all erlang
# asdf install erlang <version>
fi

if [ ! -d "$ASDF_DIR/plugins/elixir" ]; then
    echo "===> Installing ASDF elixir plugin"
    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
    # asdf list-all elixir
    # asdf install elixir <version>
    # asdf global elixir <version>
fi

if [ ! -d "$ASDF_DIR/plugins/nodejs" ]; then
    echo "===> Installing ASDF nodejs plugin"
    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

    echo "===> Importing Node.js release team OpenPGP keys to main keyring"
    # Node requires an extra step:
    # This can be flaky
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    # asdf list-all nodejs
    # asdf install nodejs <version>
    # asdf global nodejs <version>
fi


# Visit https://github.com/halcyon/asdf-java for more info
# asdf plugin-add java https://github.com/halcyon/asdf-java.git
# asdf list-all java
# asdf install java adopt-openjdk-12.0.2-10.3
# asdf install java adopt-openjdk-13+33
# echo -e '\n. $HOME/.asdf/plugins/java/set-java-home.sh' >> ~/.bashrc

if [ ! -d "$ASDF_DIR/plugins/ruby" ]; then
    echo "===> Installing ASDF ruby plugin"
    asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
    ASDF_RUBY_BUILD_VERSION=master asdf install ruby 2.6.5

    # asdf list-all ruby
    # asdf install ruby <version>
    # asdf global ruby <version>
fi

if [ ! -d "$ASDF_DIR/plugins/rust" ]; then
    echo "===> Installing ASDF rust plugin"
    asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
    # asdf list-all rust
    # asdf install rust 1.38.0 <version> # 1.38.0
    # asdf global rust <version>
fi

# Erlang
# Provides most of the needed build tools.
# pacman -S --needed base-devel
# Needed for terminal handling pacman -S ncurses

# For building with wxWidgets (start observer or debugger!) pacman -S glu mesa wxgtk2 libpng

# For building ssl pacman -S libssh

# ODBC support sudo pacman -S unixodbc
