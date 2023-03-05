#!/usr/bin/env bash

# Clone the repository
git clone https://github.com/RickSucksATLinux/install-scripts-of-my-own.git

# Copy the scripts to the home directory
cp install-scripts-of-my-own/install.sh ~/
cp install-scripts-of-my-own/i3wmconfig.sh ~/

# Run the scripts
bash ~/install.sh
bash ~/i3wmconfig.sh
