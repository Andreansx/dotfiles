'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    context
    #archicon_joined
    segment_terraform_joined
    dir
    vcs_joined
    newline
    prompt_char
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    my_venv
    status_joined
    command_execution_time_joined
    time_joined
    newline
  )

  typeset -g POWERLEVEL9K_MODE=nerdfont-v3
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{#CBA6F7}╭─ "
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX="%F{#CBA6F7}├─ "
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{#CBA6F7}╰─"
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=

  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{#313244}\uE0B5"
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=' | '
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="%F{#313244}\uE0B6"
  
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B4'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL="%F{#313244}\uE0B6"
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL="%F{#CBA6F7}\uE0B6"
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL="%F{#313244}\uE0B4"
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

  ################################[ prompt_char: prompt symbol ]################################
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND='#A6E3A1'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND='#F38BA8'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

  ##################################[ dir: current directory ]##################################
  #839-6CD
  typeset -g POWERLEVEL9K_DIR_BACKGROUND='#313244'
  typeset -g POWERLEVEL9K_DIR_FOREGROUND='#CDD6F4'
  typeset -g POWERLEVEL9K_DIR_ICON_FOREGROUND='#89B4FA'
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND='#A6ADC8'
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND='#F5C2E7'
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  local anchor_files=(.bzr .citc .git .hg .node-version .python-version .go-version .ruby-version .lua-version .java-version .perl-version .php-version .tool-versions .mise.toml .shorten_folder_marker .svn .terraform CVS Cargo.toml composer.json go.mod package.json stack.yaml)
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=false
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3
  typeset -g POWERLEVEL9K_DIR_CONTENT_EXPANSION='${P9K_CONTENT/(#b)([^-]##)-*-([^-]##)/${match[1]}-${match[2]}}'
 

  #####################################[ vcs: git status ]######################################
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND='#313244'
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='#313244'
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='#313244'
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND='#313244'
  typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND='#313244'

  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=''

  function my_git_formatter() {
    emulate -L zsh
    if [[ -n $P9K_CONTENT ]]; then
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi
    
    local clean='%F{#A6E3A1}'
    local modified='%F{#FAB387}'
    local untracked='%F{#89B4FA}'
    local conflicted='%F{#F38BA8}'
    local meta='%F{#CDD6F4}'
    local res
    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
      (( $#branch > 32 )) && branch[13,-13]="…"
      res+="${meta}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
    fi
    [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] && res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"
    if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"; fi
    if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then res+=" ${modified}wip"; fi
    if (( VCS_STATUS_COMMITS_AHEAD || VCS_STATUS_COMMITS_BEHIND )); then
      (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
      (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
      (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
    fi
    (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
    [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
    (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
    (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
    (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"
    typeset -g my_git_format=$res
  }
  functions -M my_git_formatter 2>/dev/null
  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
  typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  ##########################[ status: exit code of the last command ]###########################
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_BACKGROUND='#313244'
  typeset -g POWERLEVEL9K_STATUS_OK=true
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
#  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION=$'\uF00C'
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND='#A6E3A1'
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
#  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION=$'\uF00D'
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND='#F38BA8'
  typeset -g POWERLEVEL9K_STATUS_OK_ICON_FOREGROUND='#A6E3A1'
  typeset -g POWERLEVEL9K_STATUS_ERROR_ICON_FOREGROUND='#F38BA8'
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_ICON_FOREGROUND='#FF4E5E'

  ###################[ command_execution_time: duration of the last command ]###################
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='#A6ADC8'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='#313244'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_ICON_FOREGROUND='#F5C2E7'

  ####################################[ time: current time ]####################################
  typeset -g POWERLEVEL9K_TIME_FOREGROUND='#A6ADC8'
  typeset -g POWERLEVEL9K_TIME_BACKGROUND='#313244'
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  ##################################[ context: user@hostname ]##################################
  typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND='#CBA6F7'
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND='#11111B'
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='#F38BA8'
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='#11111B'
  typeset -g POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='#E05263'
  typeset -g POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='#0D1117'
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%B %b'
  #typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%B󱉸%b'
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_CONTENT_EXPANSION_HAS_CONTENT=true

  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=on
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
  (( ! $+functions[p10k] )) || p10k reload

    function prompt_archicon() {
        p10k segment -b '#1B263B' -f '#0D1117' -t ' '
    }
    
    function prompt_segment_terraform() {
      if [[ -d .terraform ]] || [[ -f *.tf(#qN[1]) ]]; then
        local workspace="default"
        if command -v terraform >/dev/null 2>&1; then
          workspace=$(terraform workspace show 2>/dev/null || echo "default")
        fi
        
        local bg_color='#313244'
        local fg_color='#A6ADC8'
        local icon_color='#89B4FA'
        
        local icon="%F{$icon_color$}%B 󱁢 %b%f"
        
        local display_text=""
        if [[ $workspace == "default" ]]; then
          display_text="%BTerraform%b"
        else
          display_text="$workspace"
        fi
        
        p10k segment -b "$bg_color" -f "$fg_color" -i "$icon" -t "$display_text"
      fi
    }

    ################[ my_venv: python virtual environment ]################
    function prompt_my_venv() {
      [[ -n $VIRTUAL_ENV ]] || return
      local venv_name="${VIRTUAL_ENV:t}"
      p10k segment -b '#313244' -f '#A6ADC8' -i '%F{#89B4FA}%B󰌠 %b%f' -t "$venv_name"
    }
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}
(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
