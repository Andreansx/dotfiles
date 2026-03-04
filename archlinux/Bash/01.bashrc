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
alias gp='git push'
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

#M_BG="39;40;34"        #272822
M_BG="237;242;213"	#edf2d5
M_FG="248;248;242"     #F8F8F2
M_COMMENT="117;113;94"  #75715E
M_PINK="38;172;249"     #F92672 
M_GREEN="166;226;46"    #A6E22E
M_YELLOW="230;219;116"  #E6DB74
M_PURP="60;95;250"  #AE81FF
M_ORANGE="253;151;31"   #FD971F
M_BLUE="102;217;239"    #66D9EF
M_BL="64;64;55"	#404037
MK_D="106;48;252"	#6a30fc
RED="226;46;82"

TC_FG() { echo -ne "\[\e[38;2;${1}m\]"; }
TC_BG() { echo -ne "\[\e[48;2;${1}m\]"; }
RS_COL="\[\e[0m\]"

SEP_R=""
SEP_L=""
GIT_BRANCH_SYMBOL=""
PATH_SEPARATOR=""
USR=" "
#USR="$"
HOST_SYMBOL="󰒋"
#USR_PROMPT_SYM="❯"
USR_PROMPT_SYM="❱"
PROMPT_SYMBOL_ROOT="#"
ERR="✘"

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

  PS1_TEXT+="\n$(TC_FG ${MK_D})╭── $(TC_BG ${MK_D})$(TC_FG ${M_BG}) ${USR}${RS_COL}$(TC_BG ${M_PURP})$(TC_FG ${MK_D})${SEP_R}$(TC_FG ${M_FG})$(TC_BG ${M_PURP}) \u@\h "
  PS1_TEXT+="$(TC_BG ${M_PINK})$(TC_FG ${M_PURP})${SEP_R}"
  PS1_TEXT+="$(TC_FG ${M_FG})  \w "

  local git_info
  git_info=$(parse_git_branch_and_status)
  if [[ -n "$git_info" ]]; then
    local git_color_bg=${M_GREEN}
    if [[ "$git_info" == *"*"* ]]; then
      git_color_bg=${M_YELLOW}
    fi

    PS1_TEXT+="$(TC_BG ${git_color_bg})$(TC_FG ${M_PINK})${SEP_R}"
    PS1_TEXT+="$(TC_FG ${M_BL}) ${git_info} "
    PS1_TEXT+="$(TC_BG ${M_BL})$(TC_FG ${git_color_bg})${RS_COL}$(TC_FG ${git_color_bg})${SEP_R}"
  else
    PS1_TEXT+="$(TC_BG ${M_BG})$(TC_FG ${M_PINK})${RS_COL}$(TC_FG ${M_PINK})${SEP_R}"
  fi
  PS1_TEXT+="${RS_COL}"

  # here is the right part of the prompt
  # rhs fragment
  local rhs_prompt=""
  if [ "$exit_status" -ne 0 ]; then
    local error_string="${ERR} ${exit_status}"
    # counting distance to print the rhs correctly
    local error_string_len=$(printf "%s" "${error_string}" | wc -c)
    local terminal_width=$(tput cols)
    local start_column=$((terminal_width - error_string_len))

    rhs_prompt+="\[$(tput sc)\]"
    rhs_prompt+="\[$(tput hpa ${start_column})\]"
    rhs_prompt+="$(TC_FG ${RED})${error_string}${RS_COL}"
    rhs_prompt+="\[$(tput rc)\]"
  fi

  # lhs fragmetn
  local lhs_prompt_char_color=${MK_D}
  local lhs_prompt_char="╰── ${USR_PROMPT_SYM}"

  if [ "$UID" -eq 0 ]; then
    lhs_prompt_char_color=${M_ORANGE}
    lhs_prompt_char=${PROMPT_SYMBOL_ROOT}
  fi
  
  local lhs_prompt="$(TC_FG ${lhs_prompt_char_color})${lhs_prompt_char} ${RS_COL}"

  PS1_TEXT+="\n${lhs_prompt}${rhs_prompt}"

  PS1="${PS1_TEXT}"
}

PROMPT_COMMAND=build_prompt

#you basically dont even need this if you dont want special colors when using ls

# LS_COLORS with vivid
# here is mine LS_COLORS but you need to do this:
# run: 'vivid generate molakai' and paste the entire output here:
export LS_COLORS="$molokai_vivid"
# ^ comment this if you dont want to generate vivid colors

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi
echo -e "\n\n"
fastfetch
echo -e "\n"
