#!/bin/bash

# create links to the dotfiles
ln -s $PWD/.xinitrc ~/.xinitrc
ln -s $PWD/.wifi-config ~/.wifi-config
ln -s $PWD/.wifi-profiles ~/.wifi-profiles
ln -s $PWD/wf_connect /usr/local/bin/wf_connect
