#!/bin/sh
bemenu --prompt 'enter expression' -i -l 7 --fn 'MesloLGS NF 20' --fb '#303446' --ff '#81c8be' --nb '#303446' --nf '#f2d5cf' --tb '#303446' --hb '#303446' --tf '#ca9ee6' --hf '#8caaee' --nf '#f2d5cf' --af '#f2d5cf' --ab '#303446' </dev/null >/tmp/question 2>/dev/null
sed -i 's/^/print(/' /tmp/question && sed -i 's/$/)/' /tmp/question
cat /tmp/question | lua /tmp/question >/tmp/answer
sed -i 's/^/‎/' /tmp/answer
cat /tmp/answer | xargs -n 1 notify-send -i ~/.config/waybar/calculator.png -t 99999999 'And the answer is...'
cat /tmp/answer | wl-copy -n
rm -f /tmp/question /tmp/answer
