#!/usr/bin/env zsh

path=$1

RED=$'\e[1;31m'
GRN=$'\e[1;32m'
YEL=$'\e[1;33m'
BLU=$'\e[1;34m'
RES=$'\e[0m'
printf "\n${RED}------${GRN}------${YEL}------${BLU}------\e[1;0m------\n"
printf "\n\n      ${RED}██${GRN}██${YEL}██${BLU}██${RES}██\n\n"
printf "\n     ${YEL} backup.zsh\n\n"

printf "${BLU} Backing up configs for:\n- i3wm\n- picom\n- kitty\n- polybar\n- fastfetch ${RES}\n"
printf "\n\n${RED} Do you want to continue? This will overwrite dotfiles in current dotfiles repo directory\n"
printf "\n[Y]es/[N]o: ${GRN}"
read -k 1 choice

printf "${RES}\n"

#if [[ "$choice" == [Yy] ]]; then
#    echo -e "$RED ok Yy\n\n$RES"
#fi

if [[ "$path" == "t" ]]; then
    p="${HOME}/Documents/test/"
else
    p="${HOME}/Documents/dotfiles/"
fi

choice=${choice//$'\r'/}

case "$choice" in 
    [yY])
        printf "${GRN} Running backup ${RES} \n"
        /usr/bin/cat ~/.config/i3/config > "$p"i3/config
        /usr/bin/cat ~/.config/picom/picom.conf > "$p"picom/picom-i3-desaturated.conf
        /usr/bin/cat ~/.config/fastfetch/config.jsonc > "$p"fastfetch/config-i3-desaturated.jsonc
        ;;
    [nN])
        echo -e "${YEL} aborted${RES}\n"
        ;;
    *)
        echo -e "${RED} invalid option${RES}\n"
        ;;
esac
