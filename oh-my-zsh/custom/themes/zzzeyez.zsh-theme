if [ "$USER" = "root" ]
then CARETCOLOR="red"
else CARETCOLOR="blue"
fi

ZLE_RPROMPT_INDENT=0

_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'

PROMPT='%m%{${fg_bold[magenta]}%} %{$reset_color%}%{${fg[green]}%}%3~ %{${fg_bold[$CARETCOLOR]}%}%{${reset_color}%}${_newline}'
RPROMPT='%{${_lineup}%}$(git_super_status)%{${_linedown}%}'

function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"


