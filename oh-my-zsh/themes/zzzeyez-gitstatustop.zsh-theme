function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return

  # Checks if working tree is dirty
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi

  if [[ -n $STATUS ]]; then
    GIT_PROMPT_COLOR="$ZSH_THEME_GIT_PROMPT_DIRTY"
    GIT_DIRTY_STAR="++"
  else
    GIT_PROMPT_COLOR="$ZSH_THEME_GIT_PROMPT_CLEAN"
    unset GIT_DIRTY_STAR
  fi

  echo "$GIT_DIRTY_STAR$GIT_PROMPT_COLOR$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

if [ "$USER" = "root" ]
then CARETCOLOR="red"
else CARETCOLOR="blue"
fi

ZLE_RPROMPT_INDENT=0

_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'

PROMPT='%m%{${fg_bold[magenta]}%} %{$reset_color%}%{${fg[green]}%}%3~ %{${fg_bold[$CARETCOLOR]}%}%{${reset_color}%}${_newline}'
RPROMPT='%{${_lineup}%}$(git_prompt_info)%{${_linedown}%}'

function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_SEPARATOR=""
#ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[black]%}"
#ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[cyan]%}%{-%G%}"
#ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[cyan]%}%{x%G%}"
#ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[cyan]%}%{ +%G%}"
#ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
#ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%}%{%G%}"

MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"
