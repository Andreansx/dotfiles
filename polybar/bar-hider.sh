#!/bin/bash

is_active_window_fullscreen() {
    if ! command -v xdotool &> /dev/null; then
        echo "Error: xdotools is not installed. Run: 'sudo pacman -S xdotool'"
        return 1
    fi
    
    active_win_id=$(xdotool getactivewindow)
    
    xprop -id "$active_win_id" _NET_WM_STATE | grep -q "_NET_WM_STATE_FULLSCREEN"
}

toggle_polybar() {
    if is_active_window_fullscreen; then
        polybar-msg cmd hide
    else
        polybar-msg cmd show
    fi
}

toggle_polybar

i3-msg -t subscribe -m '["window", "workspace"]' | while read -r event; do
    toggle_polybar
done
