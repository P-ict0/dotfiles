#!/bin/bash

i3PATH=~/.config/i3/config
alacrittyPATH=~/.config/alacritty/alacritty.yml
tmuxPATH=~/.tmux.config

cp $i3PATH ~/dotfiles/i3/config

cp $alacrittyPATH ~/dotfiles/alacritty/alacritty.yml

cp $i3PATH ~/dotfiles/tmux/tmux.config

echo "Done!"
