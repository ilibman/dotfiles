#!/bin/bash

# install the latest version of neovim
sudo yay -S neovim-git --cleanbuild --removemake --cleanafter

# LSP for python
sudo yay -S basedpyright --cleanbuild --removemake --cleanafter

# this is needed for the telescope plugin (and any other plugins that might want to grep stuff)
sudo pacman -S ripgrep --needed --noconfirm

sudo pacman -S tree-sitter-cli --needed --noconfirm

# this is needed for eslint lsp
npm i -g vscode-langservers-extracted
npm i -g eslint_d

# create links to the dotfiles
ln -s $PWD/init.lua ~/.config/nvim/init.lua
ln -s $PWD/lua ~/.config/nvim/lua
ln -s $PWD/after ~/.config/nvim/after
