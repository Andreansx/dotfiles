# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"



# Plugins
plugins=(
  git
  extract
  sudo
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  terraform
)

#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5e473f,dim'

source $ZSH/oh-my-zsh.sh

alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias fping='ping -c 50 -i 0.2'
alias rbt='systemctl reboot'
alias pwof='systemctl poweroff'

alias -g -- vim='nvim'
alias -g -- -sybau='-Syu'
alias -g -- ivm='nvim' 
alias -g -- Do='Documents'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias mkdir='mkdir -pv'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias -g -- ytdlp='yt-dlp'

alias update='sudo pacman -Syu'
alias cleanup='yay -Sc'

alias c='clear'
alias h='history'
alias j='jobs -l'

alias server='python -m http.server'

alias gitpush='git push'
alias gps='git push'
alias gpl='git pull'
alias gs='git status'
alias ga='git add . && git status'
alias gc='git commit'

mkcd() {
  mkdir -p "$1" && cd "$1"
}

extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xvjf "$1" ;;
      *.tar.gz)  tar xvzf "$1" ;;
      *.tar.xz)  tar xvJf "$1" ;;
      *.bz2)     bunzip2 "$1"  ;;
      *.rar)     unrar x "$1"  ;;
      *.gz)      gunzip "$1"   ;;
      *.tar)     tar xvf "$1"  ;;
      *.tbz2)    tar xvjf "$1" ;;
      *.tgz)     tar xvzf "$1" ;;
      *.zip)     unzip "$1"    ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1"     ;;
      *.deb)     ar x "$1"     ;;
      *)         echo "'$1' cannot be extracted by >extract<" ;;
    esac
  else
    echo "'$1' is a invalid file"
  fi
}

# === PATH Configuration ===
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -a ff_presets
ff_presets=(
    "$HOME/.config/fastfetch/maggotnizer3.PNG:24:0:5:5"
    "$HOME/.config/fastfetch/maggotnizer1.PNG:22:0:3:3"
    "$HOME/.config/fastfetch/maggotnizer2.PNG:28:3:0:0"
    "$HOME/.config/fastfetch/maggotnizer0.PNG:25:1:0:0"
    "$HOME/.config/fastfetch/maggotnizer4.PNG:20:2:2:2"
    "$HOME/.config/fastfetch/maggotnizer5.PNG:34:0:0:0"
    "$HOME/.config/fastfetch/maggotnizer6.PNG:34:0:0:0"
    "$HOME/.config/fastfetch/maggotnizer7.PNG:34:0:2:2"


)

rand_idx=$(( $RANDOM % ${#ff_presets[@]} + 1 ))
selected="${ff_presets[$rand_idx]}"

parts=(${(@s/:/)selected})
img_path="${parts[1]}"
img_width="${parts[2]}"
pad_top="${parts[3]}"
pad_left="${parts[4]}"
pad_right="${parts[5]}"

echo "\n\n\n\n\n"
ff --logo "$img_path" --logo-width "$img_width" --logo-padding-top "$pad_top" --logo-padding-left "$pad_left" --logo-padding-right "$pad_right"
echo "\n\n"
