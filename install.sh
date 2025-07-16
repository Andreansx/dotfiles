#!/bin/bash

DIR="$HOME/.config"


echo -e "\n\n      Script for istalling my dotfiles\n"
echo -e "       This script will backup your entire .config directory and overwrite it with my dotfiles\n\n     "

read -p "Proceed ? Y/N: " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
