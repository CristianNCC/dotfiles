#!/bin/bash

# Setup 

sudo ln -snf ~/repos/dotfiles/.bashrc ~/.bashrc

sudo ln -snf ~/repos/dotfiles/.vimrc ~/.vimrc

sudo ln -snf ~/repos/dotfiles/.aliasrc ~/.aliasrc

sudo apt update
sudo apt upgrade 

# Basic programming tools
sudo apt install build-essential vim git

# Analyis tools
sudo apt install clang-tools valgrind

# Cleanup 
sudo apt autoremove
sudo apt clean
