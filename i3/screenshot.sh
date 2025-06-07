#!/bin/bash

# simple script to turn off picom to not have blur on screenshots

a
killall -q picom

while pgrep -u $UID -x picom >/dev/null; do sleep 0.1; done


SCREENSHOT_DIR=~/Pictures/Screenshots


mkdir -p $SCREENSHOT_DIR

FILENAME="$SCREENSHOT_DIR/$(date +%F_%T).png"

case "$1" in
    select_clipboard)
        maim -s | xclip -selection clipboard -t image/png
        ;;
    select_file)
        maim -s "$FILENAME"
        ;;
    full_clipboard)
        maim | xclip -selection clipboard -t image/png
        ;;
    *)
        maim "$FILENAME"
        ;;
esac

(sleep 1 && picom --experimental-backends) &

exit
