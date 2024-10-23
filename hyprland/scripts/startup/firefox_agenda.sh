#!/bin/bash
firefox --no-remote --new-window "https://www.icloud.com/calendar/" &
sleep 1
firefox --new-tab "https://www.icloud.com/reminders/" &
sleep 1
firefox --new-tab "https://mail.google.com/" &
sleep 1
firefox --new-tab "https://outlook.office.com/" &
