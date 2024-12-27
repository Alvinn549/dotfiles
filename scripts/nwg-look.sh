#!/bin/bash

check_nwg_look_installed() {
    command -v nwg-look >/dev/null 2>&1
}

# Check if nwg-look is already installed
if check_nwg_look_installed; then
    echo "nwg-look is already installed."
    exit 0
fi

# Create a temporary directory
temp_dir=$(mktemp -d)
cd "$temp_dir"

sudo apt install -y golang libgtk-3-dev libcairo2-dev libglib2.0-bin zip

# Download and extract nwg-look v0.2.7
wget https://github.com/nwg-piotr/nwg-look/archive/refs/tags/v0.2.7.zip
unzip v0.2.7.zip
cd nwg-look-0.2.7

# Build and install nwg-look
make build
sudo make install

cd "$temp_dir"
rm -rf nwg-look-0.2.7
rm v0.2.7.zip
rmdir "$temp_dir"
