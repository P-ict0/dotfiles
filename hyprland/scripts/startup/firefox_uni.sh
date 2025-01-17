#!/bin/bash
firefox --no-remote --new-window "https://canvas.tue.nl" &
sleep 0.5
firefox --new-tab "https://chatgpt.com/" &
sleep 0.5
firefox --new-tab "file:///$HOME/uni/" &
