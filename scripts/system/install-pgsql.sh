#!/usr/bin/env bash

# Install PostgreSQL Database
echo "Installing PostgreSQL..."

is_pkg_installed() {
    echo "Testing for package ${1}"
    pacman -Qi "$1" &>/dev/null
}

if ! is_pkg_installed "postgresql"; then
    yay -S --noconfirm --needed postgresql
fi

# Check if data directory exists.
if [[ ! -d "/var/lib/postgres/data" ]] || [ -z "$(ls -A /var/lib/postgres/data 2>/dev/null)" ]; then
    echo "Initializing PostgreSQL Database"
    sudo -u postgres initdb -D /var/lib/postgres/data --locale=C.UTF-8 --encoding=UTF8 --data-checksums
else
    echo "PostgreSQL data directory already initialized..."
fi

# Start and enable PostgreSQL service
echo "Starting PostgreSQL Service"
sudo systemctl start postgres
sudo systemctl enable postgres

wait 2

# Create a database with current user if it doesn't exists
echo "Setting up postgres user..."
if ! sudo -u postgres psql -tAc "SELECT 1 FROM pg_user WHERE username = '$USER'" | grep -q 1; then
    sudo -u postgres createuser --interactive -d "$USER"
    echo "Create PostgreSQL user: ${USER}"
else
    echo "PostgreSQL user: ${USER} already exists!"
fi

# Create a default database for user if it doesn't exists.
if ! sudo -u postgres psql -lqt | cut -d\| -f 1 | grep -qw "${USER}"; then
    echo "Create default database for ${USER}"
    createdb "${USER}"
else
    echo "Database ${USER} already exists!"
fi

echo "PostgreSQL installation and setup complete!"
