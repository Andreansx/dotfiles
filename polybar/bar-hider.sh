#!/bin/bash

is_active_window_maximized() {
    if ! command -v xdotool &> /dev/null; then
        echo "Error: xdotool is not installed. Run: 'sudo pacman -S xdotool'"
        return 1
    fi
    
    active_win_id=$(xdotool getactivewindow)

    if [ -z "$active_win_id" ]; then
        return 1
    fi
    
    local properties
    properties=$(xprop -id "$active_win_id" _NET_WM_STATE)
    
    if echo "$properties" | grep -q "_NET_WM_STATE_FULLSCREEN"; then
        return 0     
    elif echo "$properties" | grep "MAXIMIZED_HORZ" | grep -q "MAXIMIZED_VERT"; then
        return 0
    else
        return 1
    fi
}

toggle_polybar() {
    if is_active_window_maximized; then
        polybar-msg cmd hide
    else
        polybar-msg cmd show
    fi
}

toggle_polybar

i3-msg -t subscribe -m '["window", "workspace"]' | while read -r event; do
    toggle_polybar
done
