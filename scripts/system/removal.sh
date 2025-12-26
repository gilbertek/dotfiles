#!/usr/bin/env bash

set -e
echo "Removing extra from Omarchi Install"

APP_LIST=("Basecamp" "Github" "Google Contacts" "Google Messages" "Google Photos" "HEY" "X" "Youtube" "Zoom")

# spotify
# typora
# xournalpp
PKG_LIST=(1password-beta 1password-cli signal-desktop)

for app in "${APP_LIST[@]}"; do
    echo "Removing $app" app
    omarchi-webapp-remove "$app"
done

for pkg in "${PKG_LIST[@]}"; do
    if pacman -Qqe "$pkg" &>/dev/null; then
        echo "Removing $pkg..."
        yay -Rns --noconfirm "$pkg"
    fi
done

# echo "Removing typora desktop app"
# rm -f "$HOME/.local/share/applications/typora.desktop"
