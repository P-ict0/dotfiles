#!/bin/bash

i3PATH=~/.config/i3/config
alacrittyPATH=~/.config/alacritty/alacritty.yml
tmuxPATH=~/.tmux.conf

# Create backups and run
mv $i3PATH ${i3PATH}.backup
cp ${PWD}/i3/config $i3PATH

mv $alacrittyPATH ${alacrittyPATH}.backup
cp ${PWD}/alacritty/alacritty.yml $alacrittyPATH

mv $tmuxPATH ${tmuxPATH}.backup
cp ${PWD}/tmux/.tmux.conf $tmuxPATH

echo "Done!\nbackups of old configs made in the same directory with extension '.backup'"
