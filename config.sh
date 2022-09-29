#!/bin/bash

# Optional: Vbox guest additions
# sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

###### Setup dotfiles #####

rm ~/.bashrc
ln -s ~/repos/dotfiles/.bashrc ~/.bashrc

rm ~/.vimrc
ln -s ~/repos/dotfiles/.vimrc ~/.vimrc

rm ~/.aliasrc
ln -s ~/repos/dotfiles/.aliasrc ~/.aliasrc

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

###### Vim Addons #####

# SuperTab.
mkdir -p ~/.vim/pack/plugins/start
git clone --depth=1 https://github.com/ervandew/supertab.git ~/.vim/pack/plugins/start/supertab

##### Cleanup #####
sudo apt-get autoremove
sudo apt-get clean
