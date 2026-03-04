#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ARCH="$DOTFILES_DIR/archlinux"

echo "Install everything (i3wm full setup) or only universal configs?"
echo "  1 Full i3wm setup"
echo "  2 Universal only (zsh, nvim, kitty, rofi, fastfetch)"
read -rp "[1/2]: " CHOICE

if [[ "$CHOICE" != "1" && "$CHOICE" != "2" ]]; then
  echo "Invalid choice exting"
  exit 1
fi

mkdir -p \
  ~/.config/fastfetch \
  ~/.config/kitty/themes \
  ~/.config/nvim/lua/config \
  ~/.config/nvim/lua/plugins \
  ~/.config/rofi \
  ~/.local/bin

if [[ "$CHOICE" == "1" ]]; then
  mkdir -p \
    ~/.config/i3 \
    ~/.config/picom \
    ~/.config/polybar/themes
fi

if [[ "$CHOICE" == "1" ]]; then
  cp "$ARCH/zsh/.zshrc" ~/.zshrc
else
  cp "$ARCH/zsh/.zshrc-generic" ~/.zshrc
fi

cp "$ARCH/zsh/.p10k-dark.zsh" ~/.p10k-dark.zsh
cp "$ARCH/zsh/.p10k-light.zsh" ~/.p10k-light.zsh

if [[ "$CHOICE" == "1" ]]; then
  cp "$ARCH/zsh/dark-theme.zsh" ~/dark-theme.zsh
  cp "$ARCH/zsh/light-theme.zsh" ~/light-theme.zsh
  chmod +x ~/dark-theme.zsh ~/light-theme.zsh
fi

cp "$ARCH/zsh/ff" ~/.local/bin/ff
chmod +x ~/.local/bin/ff

cp "$ARCH/fastfetch/config-dark.jsonc" ~/.config/fastfetch/config-dark.jsonc
cp "$ARCH/fastfetch/config-light.jsonc" ~/.config/fastfetch/config-light.jsonc

if [[ "$CHOICE" == "1" ]]; then
  cp "$ARCH/i3/config" ~/.config/i3/config
fi

cp "$ARCH/kitty/kitty.conf" ~/.config/kitty/kitty.conf
cp "$ARCH/kitty/themes/dark.conf" ~/.config/kitty/themes/dark.conf
cp "$ARCH/kitty/themes/light.conf" ~/.config/kitty/themes/light.conf
ln -sf ~/.config/kitty/themes/dark.conf ~/.config/kitty/theme.conf

cp "$ARCH/nvim/init.lua" ~/.config/nvim/init.lua
cp "$ARCH/nvim/lazyvim.json" ~/.config/nvim/lazyvim.json
cp "$ARCH/nvim/stylua.toml" ~/.config/nvim/stylua.toml
cp "$ARCH/nvim/lua/config/lazy.lua" ~/.config/nvim/lua/config/lazy.lua
cp "$ARCH/nvim/lua/config/keymaps.lua" ~/.config/nvim/lua/config/keymaps.lua
cp "$ARCH/nvim/lua/config/autocmds.lua" ~/.config/nvim/lua/config/autocmds.lua
cp "$ARCH/nvim/lua/config/options.lua" ~/.config/nvim/lua/config/options.lua
cp "$ARCH/nvim/lua/plugins/colors.lua" ~/.config/nvim/lua/plugins/colors.lua

if [[ "$CHOICE" == "1" ]]; then
  cp "$ARCH/picom/picom.conf" ~/.config/picom/picom.conf

  cp "$ARCH/polybar/config.ini" ~/.config/polybar/config.ini
  cp "$ARCH/polybar/dark.ini" ~/.config/polybar/themes/dark.ini
  cp "$ARCH/polybar/light.ini" ~/.config/polybar/themes/light.ini
  cp "$ARCH/polybar/launch.sh" ~/.config/polybar/launch.sh
  cp "$ARCH/polybar/bar-hider.sh" ~/.config/polybar/bar-hider.sh
  chmod +x ~/.config/polybar/launch.sh ~/.config/polybar/bar-hider.sh
  ln -sf ~/.config/polybar/themes/dark.ini ~/.config/polybar/themes/colors.ini
fi

cp "$ARCH/rofi/config.rasi" ~/.config/rofi/config.rasi
cp "$ARCH/rofi/custom-theme.rasi" ~/.config/rofi/custom-theme.rasi

cp "$ARCH/Vim/.vimrc" ~/.vimrc
echo "Done."
