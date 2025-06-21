#!/bin/bash

LIGHT_WALLPAPER="/home/yeendrea/Pictures/wallpaper2.PNG"

feh --bg-scale "$LIGHT_WALLPAPER"

ln -sf ~/.config/kitty/themes/light.conf ~/.config/kitty/theme.conf

kitty @ send-text --match=all \x1b_r\x1b\\

ln -sf ~/.config/kitty/themes/light.conf ~/.config/kitty/theme.conf

FF_SCRIPT_PATH="$HOME/.local/bin/ff"
FASTFETCH_CONFIG_PATH="$HOME/.config/fastfetch/config-light.jsonc"

echo '#!/bin/sh' > "$FF_SCRIPT_PATH"
echo "exec fastfetch --config '$FASTFETCH_CONFIG_PATH'" >> "$FF_SCRIPT_PATH"
chmod +x "$FF_SCRIPT_PATH"


echo "switched to light theme"
