#!/bin/bash

# Setup the .bashrc file.
rm ~/.bashrc
ln -s ~/repos/dotfiles/.bashrc ~/.bashrc

# And the .vimrc file.
rm ~/.vimrc
ln -s ~/repos/dotfiles/.vimrc ~/.vimrc

# Update and upgrade.
sudo apt-get update
sudo apt-get upgrade 

# Basic programming tools.
sudo apt-get install build-essential vim git

# Misc tools.
sudo apt-get install curl tree mlocate

# Cleanup.
sudo apt-get autoremove
sudo apt-get clean
