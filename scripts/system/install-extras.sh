#!/usr/bin/env bash

# Install GNU Stow, wget and extras
PKG_LIST=(
    stow
    wget
)

for pkg in "${PKG_LIST[@]}"; do
    echo "Installing $pkg..."
    sudo pacman -Sy --noconfirm --needed "$pkg"
done
