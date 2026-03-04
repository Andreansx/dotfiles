#!/bin/bash

DARK_WALLPAPER="/home/yeendrea/Pictures/aesthetic_deer.jpg"

feh --bg-scale "$DARK_WALLPAPER" --bg-scale "$DARK_WALLPAPER"



FF_SCRIPT_PATH="$HOME/.local/bin/ff"
FASTFETCH_CONFIG_PATH="$HOME/.config/fastfetch/config-dark.jsonc"

echo '#!/bin/sh' > "$FF_SCRIPT_PATH"
echo "exec fastfetch --config '$FASTFETCH_CONFIG_PATH' \"\$@\"" >> "$FF_SCRIPT_PATH"
chmod +x "$FF_SCRIPT_PATH"

ln -sf ~/.p10k-dark.zsh ~/.p10k.zsh

ln -sf ~/.config/polybar/themes/dark.ini ~/.config/polybar/themes/colors.ini

polybar-msg cmd restart

ln -sf ~/.config/kitty/themes/dark.conf ~/.config/kitty/theme.conf

kitty @ send-text --match=all \x1b_r\x1b\\
echo "switched to dark mode"
