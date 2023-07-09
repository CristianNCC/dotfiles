#!/bin/bash

# Optional: Vbox guest additions
# sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

###### Setup dotfiles #####

sudo rm ~/.bashrc
sudo ln -s ~/repos/dotfiles/.bashrc ~/.bashrc

sudo rm ~/.vimrc
sudo ln -s ~/repos/dotfiles/.vimrc ~/.vimrc

sudo rm ~/.aliasrc
sudo ln -s ~/repos/dotfiles/.aliasrc ~/.aliasrc

##### Update and upgrade #####

sudo apt-get update
sudo apt-get upgrade 

##### Tools #####

# Basic programming tools.
sudo apt-get install build-essential vim git

# Analyis tools.
sudo apt-get install clang-tools valgrind

# Misc tools.
sudo apt-get install curl tree mlocate iotop nasm bison 

# Cross compiler dependencies
sudo apt-get install diffutils texinfo flex libgmp-dev

##### Cleanup #####
sudo apt-get autoremove
sudo apt-get clean
