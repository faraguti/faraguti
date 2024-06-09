#!/bin/bash

# Update package lists
apt update

# Install necessary packages
apt-get install -y smartmontools lsscsi mailutils ksh lvm2 git

# Create directory for bht and navigate to it
mkdir -p /root/bht-data
cd /root/bht-data

# Clone the bht repository
git clone https://github.com/ezonakiusagi/bht.git

# Add bht to PATH if not already present
BHT_PATH="/root/bht-data/bht"
if ! echo "$PATH" | grep -q "$BHT_PATH"; then
    echo "export PATH=\"$PATH:$BHT_PATH\"" >> /root/.bashrc
fi

# Source the .bashrc to apply the new PATH immediately
source /root/.bashrc

echo "Setup completed successfully."
