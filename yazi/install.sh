#!/bin/bash

# install yazi
sudo pacman -S yazi --needed --noconfirm

# create links to the dotfiles
ln -s $PWD/yazi.toml ~/.config/yazi/yazi.toml
