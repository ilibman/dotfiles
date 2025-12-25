#!/bin/bash

# install the latest version of neovim
# yay -S neovim-git

# LSP for python
# yay -S basedpyright

# this is needed for the telescope plugin (and any other plugins that might want to grep stuff)
# sudo pacman -S ripgrep

# create links to the dotfiles
ln -s $PWD/init.lua ~/.config/nvim/init.lua
ln -s $PWD/lua ~/.config/nvim/lua
ln -s $PWD/after ~/.config/nvim/after
