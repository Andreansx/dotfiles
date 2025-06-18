# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"



# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  extract
  sudo
  colored-man-pages
)

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
alias sysctlr='systemctl reboot'

alias -g -- -sybau='-Syu'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias mkdir='mkdir -pv'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias update='yay -Syu'
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

ssh-ccr() {

  echo -ne "\033]0;MikroTik CCR2004\007"

  echo -e "\n\e[1;35mConnecting to MikroTik CCR2004...\e[0m\n"

  ssh admin@192.168.88.1
  echo -ne "\033]0;${USER}@${HOST}\007"
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

echo -e "\n\n\n\n\n\n\n\n"
fastfetch
echo -e "\n"

