#!/bin/bash

#############################################################################
# This script is used to start up the system and launch applications with   #
# delays. It is meant to be run at startup.                                 #
# Apps opened:                                                              #
# Workspace 10: btop                                                        #
# Workspace 6: Notion                                                       #
# Workspace 5: Firefox Agenda                                               #
# Workspace 4: Firefox Discord                                              #
# Workspace 3: Spotify                                                      #
# Workspace 2: Firefox                                                      #
# Workspace 1: Terminal                                                     #
# Special Workspace: Firefox (WhatsApp)                                     #
#############################################################################


# Startup apps with delays
dunstctl set-paused false
notify-send -t 100000 "Starting up..."
sleep 2
hyprctl dispatch workspace 10
kitty -e btop &
sleep 1
hyprctl dispatch workspace 6
notion-app &
sleep 4
hyprctl dispatch workspace 5
bash $HOME/scripts/startup/firefox_agenda.sh
sleep 2
hyprctl dispatch togglespecialworkspace
firefox --no-remote --new-window https://web.whatsapp.com/ &
sleep 1
hyprctl dispatch togglespecialworkspace
sleep 0.5
hyprctl dispatch workspace 4
firefox --no-remote --new-window https://discord.com/channels/@me &
sleep 2
hyprctl dispatch workspace 3
rm -rf $HOME/.cache/spotify/Browser/* $HOME/.cache/spotify/Data/* $HOME/.cache/spotify/Storage/* 2>/dev/null &
spotify-launcher &
sleep 2
hyprctl dispatch workspace 2
firefox &
sleep 2
hyprctl dispatch workspace 1
kitty -e $HOME/scripts/startup/greeting_terminal.sh &

dunstctl close-all
notify-send -t 5000 "Setup done!"
