#!/bin/bash

# First, install the system if necessary
./system.sh

# Then link in all of the dot files and scripts
./link-dots.sh
./link-scripts.sh
./link-others.sh

# Install resource software
./resources.sh

# Do some application-specific config
./bar.sh
./vim.sh
./zsh.sh
# ./systemd.sh # Disabled for now since I don't have an unit files specified

# Be done
archey3
echo "Installation complete!"
