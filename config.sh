#!/bin/bash

sudo echo -e "\nPROMPT_DIRTRIM=1\n" >> ~/.bashrc
sudo echo -e "\nalias python=python3" >> ~/.bashrc
sudo echo -e "\nalias pip=pip3\n" >> ~/.bashrc

# Setup the .bashrc file.
rm ~/.bashrc
ln -s ~/repos/dotfiles/.bashrc ~/.bashrc

# And the .vimrc file.
rm ~/.vimrc
ln -s ~/repos/dotfiles/.vimrc ~/.vimrc

# Update and upgrade.
sudo apt-get update
sudo apt-get upgrade 

# Basic build tools.
sudo apt-get install build-essential vim git



# Cleanup.
sudo apt-get autoremove
sudo apt-get clean
