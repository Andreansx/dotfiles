# ~/.bashrc
# You need to use vivid if you want to have better colors
# run: pacman -S vivid
# look at line 187


case $- in
    *i*) ;;
      *) return;;
esac
HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=10000
HISTFILESIZE=20000

shopt -s checkwinsize
shopt -s extglob

# set -o emacs
# set -o vi

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

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

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias mkdir='mkdir -pv'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Change if you are using paru instead of yay
# alias update='paru -Syu'
alias update='yay -Syu'
alias cleanup='yay -Sc'

alias c='clear'
alias h='history'
alias j='jobs -l'

alias server='python -m http.server'

# git aliases
alias gitpush='git push'
alias gs='git status'
alias ga='git add .'
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

MONOKAI_BG="39;40;34"        #272822
MONOKAI_FG="248;248;242"     #F8F8F2
MONOKAI_COMMENT="117;113;94"  #75715E
MONOKAI_PINK="38;172;249"     #F92672 
MONOKAI_GREEN="166;226;46"    #A6E22E
MONOKAI_YELLOW="230;219;116"  #E6DB74
MONOKAI_PURPLE="60;95;250"  #AE81FF
MONOKAI_ORANGE="253;151;31"   #FD971F
MONOKAI_BLUE="102;217;239"    #66D9EF

TC_FG() { echo -ne "\[\e[38;2;${1}m\]"; }
TC_BG() { echo -ne "\[\e[48;2;${1}m\]"; }
RESET_COLORS="\[\e[0m\]"

SEPARATOR_RIGHT=""
SEPARATOR_LEFT=""
GIT_BRANCH_SYMBOL=""
PATH_SEPARATOR=""
USER_SYMBOL=""
#USER_SYMBOL="$"
HOST_SYMBOL="󰒋"
PROMPT_SYMBOL_USER="❯"
PROMPT_SYMBOL_ROOT="#"
ERROR_SYMBOL="✘"

parse_git_branch_and_status() {
  local branch_name dirty_status
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    branch_name=$(git symbolic-ref --short HEAD 2>/dev/null) || \
    branch_name=$(git rev-parse --short HEAD 2>/dev/null) || \
    branch_name="DETACHED"

    if [[ -n $(git status --porcelain) ]]; then
      dirty_status="*"
    else
      dirty_status=""
    fi
    echo "${GIT_BRANCH_SYMBOL} ${branch_name}${dirty_status}"
  else
    echo ""
  fi
}

build_prompt() {
  local exit_status="$?"

  local PS1_TEXT=""

  PS1_TEXT+="$(TC_BG ${MONOKAI_PURPLE})$(TC_FG ${MONOKAI_BG}) ${USER_SYMBOL} \u@\h "

  PS1_TEXT+="$(TC_BG ${MONOKAI_PINK})$(TC_FG ${MONOKAI_PURPLE})${SEPARATOR_RIGHT}"
  PS1_TEXT+="$(TC_FG ${MONOKAI_FG}) \w " 

  local git_info
  git_info=$(parse_git_branch_and_status)
  if [[ -n "$git_info" ]]; then
    local git_color_bg=${MONOKAI_GREEN}
    if [[ "$git_info" == *"*"* ]]; then
      git_color_bg=${MONOKAI_YELLOW} 
    fi

    PS1_TEXT+="$(TC_BG ${git_color_bg})$(TC_FG ${MONOKAI_PINK})${SEPARATOR_RIGHT}"
    PS1_TEXT+="$(TC_FG ${MONOKAI_BG}) ${git_info} "
    PS1_TEXT+="$(TC_BG ${MONOKAI_BG})$(TC_FG ${git_color_bg})${SEPARATOR_RIGHT}"
  else

    PS1_TEXT+="$(TC_BG ${MONOKAI_BG})$(TC_FG ${MONOKAI_PINK})${SEPARATOR_RIGHT}"
  fi

  PS1_TEXT+="${RESET_COLORS}"

  PS1_TEXT+="\n"
  if [ "$exit_status" -ne 0 ]; then
    PS1_TEXT+="$(TC_FG ${MONOKAI_PINK})${ERROR_SYMBOL} ${exit_status} ${RESET_COLORS}"
  fi

  local prompt_char_color=${MONOKAI_GREEN}
  local prompt_char=${PROMPT_SYMBOL_USER}

  if [ "$exit_status" -ne 0 ]; then
    prompt_char_color=${MONOKAI_PINK}
  fi

  if [ "$UID" -eq 0 ]; then
    prompt_char_color=${MONOKAI_ORANGE}
    prompt_char=${PROMPT_SYMBOL_ROOT}
  fi

  if [ "$exit_status" -ne 0 ]; then
    PS1_TEXT+=" "
  fi

  PS1_TEXT+="$(TC_FG ${prompt_char_color})${prompt_char} ${RESET_COLORS}"

  PS1="${PS1_TEXT}"
}

PROMPT_COMMAND=build_prompt

# S_COLORS with vivid
# here is mine LS_COLORS but you need to do this:
# run: 'vivid generate molakai' and paste the entire output here:
export LS_COLORS="$molokai_vivid"


if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi
fastfetch
echo -e "\n"
