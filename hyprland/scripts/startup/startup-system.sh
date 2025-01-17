#!/bin/bash

#############################################################################
# This script is used to start up the system and launch applications with   #
# delays. It is meant to be run at startup.                                 #
# Apps opened:                                                              #
# Workspace 5: Firefox Agenda                                               #
# Workspace 2: Firefox Home                                                 #
# Special Workspace (S): Firefox (WhatsApp)                                 #
# Special Workspace (A): Firefox (icloud)                                   #
#############################################################################

# Startup apps with delays
dunstctl set-paused false
notify-send -t 100000 "Starting up..."

rm -rf $HOME/.cache/thumbnails/*
rm -rf $HOME/.local/share/Trash/*

sleep 3

#hyprctl dispatch workspace 9
#firefox --no-remote --new-window https://discord.com/channels/@me &
#sleep 1
#hyprctl dispatch workspace 8
#bash $HOME/scripts/startup/firefox_uni.sh
#sleep 0.5
hyprctl dispatch workspace 5
bash $HOME/scripts/startup/firefox_agenda.sh
sleep 0.5
hyprctl dispatch togglespecialworkspace chat
firefox --no-remote --new-window https://web.whatsapp.com/ &
sleep 0.5
hyprctl dispatch togglespecialworkspace chat
sleep 0.5
hyprctl dispatch togglespecialworkspace cal
firefox --no-remote --new-window "https://calendar.google.com/calendar/u/0/r" &
sleep 0.5
firefox --new-tab "https://cloud.timeedit.net" &
sleep 0.5
firefox --new-tab "https://www.icloud.com/reminders/" &
sleep 0.5
hyprctl dispatch togglespecialworkspace cal
sleep 0.5
hyprctl dispatch workspace 1
kitty -e $HOME/scripts/startup/greeting_terminal.sh &

dunstctl close-all
notify-send -t 5000 "Setup done!"
