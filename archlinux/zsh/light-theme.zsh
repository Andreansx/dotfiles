#!/bin/bash

LIGHT_WALLPAPER="/home/yeendrea/Pictures/wallpaper12.PNG"

feh --bg-scale "$LIGHT_WALLPAPER"

ln -sf ~/.config/kitty/themes/light.conf ~/.config/kitty/theme.conf

#kitty @ send-text --match=all \x1b_r\x1b\\

FF_SCRIPT_PATH="$HOME/.local/bin/ff"
FASTFETCH_CONFIG_PATH="$HOME/.config/fastfetch/config-light.jsonc"

ln -sf ~/.p10k-light.zsh ~/.p10k.zsh

ln -sf ~/.config/polybar/themes/light.ini ~/.config/polybar/themes/colors.ini

polybar-msg cmd restart

echo '#!/bin/sh' > "$FF_SCRIPT_PATH"
echo "exec fastfetch --config '$FASTFETCH_CONFIG_PATH'" >> "$FF_SCRIPT_PATH"
chmod +x "$FF_SCRIPT_PATH"


echo "switched to light theme"
