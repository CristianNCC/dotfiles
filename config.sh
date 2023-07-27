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

# Vim plugins
mkdir -pv ~/.vim/pack/git-plugins/start
cd ~/.vim/pack/git-plugins/start

git clone --depth=1 https://github.com/bfrg/vim-cpp-modern

##### Cleanup #####
sudo apt autoremove
sudo apt clean
