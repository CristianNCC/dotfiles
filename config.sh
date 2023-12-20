#!/bin/bash

##### Setup #####

sudo rm ~/.bashrc
sudo ln -s ~/repos/dotfiles/.bashrc ~/.bashrc

sudo rm ~/.vimrc
sudo ln -s ~/repos/dotfiles/.vimrc ~/.vimrc

sudo rm ~/.aliasrc
sudo ln -s ~/repos/dotfiles/.aliasrc ~/.aliasrc

sudo apt update
sudo apt upgrade 

##### Tools #####

# Basic programming tools
sudo apt install build-essential vim git

# Analyis tools
sudo apt install clang-tools valgrind

##### Cleanup #####
sudo apt autoremove
sudo apt clean
