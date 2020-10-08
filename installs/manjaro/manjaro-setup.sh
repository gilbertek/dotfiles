#!/usr/bin/env bash

# Rank mirrors to set the Fastest Download Servers
sudo pacman-mirrors --fasttrack

# Update
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm base-devel cmake zlib openssl expac wget fakeroot jshon

# Install/Activate Graphical Firewall
# sudo pacman -S gufw


# Set up firewall
sudo pacman -S ufw

# Enable it.
sudo ufw enable

# Check its status:
sudo ufw status verbose

# Enable the start-up with the system:
sudo systemctl enable ufw.service

install() {
  which "$1" &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1} ..."
    sudo pacman -S --noconfirm "$1"
  else
    echo "Already installed: $1"
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
  yay
  tig
  exa
  # exfat-utils
  tldr
  neofetch
  file
  git
  nmap
  openvpn
  diff-so-fancy
  ripgrep

  xclip
  xsel

  # rofi
  # polybar
  alacritty
  herbstluftwm
  conki

  intellij-idea-community-edition

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

  bash-language-server
  openssl
  jq
  shellcheck

  # Telegram Desktop
  # telegram-desktop-bin
)

for package in "${PACKAGES[@]}"; do
  install "$package"
done

# 4. Install some key packages

# sudo pacman -S adobe-source-sans-pro-fonts aspell-en enchant gst-libav gst-plugins-good hunspell-en icedtea-web jre8-openjdk languagetool libmythes mythes-en pkgstats ttf-anonymous-pro ttf-bitstream-vera ttf-dejavu ttf-droid ttf-gentium ttf-liberation ttf-ubuntu-font-family

# sudo pacman -S awesome openssh \
#   lxappearance-gtk3 nodejs python jq wget \
#   pulseaudio pavucontrol picom firefox curl xorg-xinit xorg-server \
#   xorg-xprop networkmanager bc arc-gtk-theme papirus-icon-theme mpv unclutter \
#   imagemagick qutebrowser dunst feh networkmanager-applet noto-fonts-emoji \
#   ttf-font-awesome npm yarn pamixer redshift reflector \
#   typescript xdotool zathura zathura-pdf-mupdf

# PHP
# sudo pacman -S composer
# sudo pacman -S php php-fpm php-apcu php-gd php-imap php-intl \
#   php-mcrypt php-memcached php-pgsql php-sqlite php-cgi xdebug

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
    git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.7.8

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

# Erlang
# Provides most of the needed build tools.
# Needed for terminal handling pacman -S ncurses

# For building with wxWidgets (start observer or debugger!) pacman -S glu mesa wxgtk2 libpng

# For building ssl pacman -S libssh

# ODBC support sudo pacman -S unixodbc

# Remove unwanted dependencies
# yay -Yc

# yay -Ss google-chrome \
#   youtube-dl

# Set default browser
# sudo xdg-settings set default-web-browser google-chrome.desktop


