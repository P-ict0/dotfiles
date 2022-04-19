#!/bin/bash

dotPATH=~/dotfiles

i3PATH=~/.config/i3/config
alacrittyPATH=~/.config/alacritty/alacritty.yml
tmuxPATH=~/.tmux.conf

cp $i3PATH ${dotPATH}/i3/config

cp $alacrittyPATH ${dotPATH}/alacritty/alacritty.yml

cp $i3PATH ${dotPATH}/tmux/.tmux.conf

echo "Done!"
