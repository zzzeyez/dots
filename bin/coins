#!/usr/bin/env bash

init_colors()
{
    for i in {0..7}; do
        printf -v "f[$i]" "%s" $'\e[3'"$i"'m'
    done
    reset=$'\e[0m'
}

print_box()
{
    local start_x="$1"
    local start_y="$2"
    local end_x="$3"
    local end_y="$4"

    if [[ "${end_x}" =~ '+' ]]; then
        local length_x="${end_x//'+'}"
    else
        local length_x="$((end_x - start_x))"
    fi

    if [[ "${end_y}" =~ '+' ]]; then
        local length_y="${end_y//'+'}"
    else
        local length_y="$((end_y - start_y))"
    fi

    local pat="$5"
    local i j

    ((length_x = length_x == 0 ? length_x + 1 : length_x))
    ((length_y = length_y == 0 ? length_y + 1 : length_y))

    ((start_x += ${x_offset:-0}))
    ((start_y += ${y_offset:-0}))

    printf "\\e[%d;%dH" "${start_y}" "${start_x}"

    for ((i = 0; i < length_y; i++)); do
        for ((j = 0; j < length_x; j++)); do
            printf "\\e[%d;%dH%s" "$((start_y + i))" "$((start_x + j))" "${pat}"
            [[ "${slow}" == "true" ]] && \
                sleep "${s_speed:-0.1}"
        done
    done
}

get_args()
{
    while (($# > 0)); do
        case "$1" in
            "-s"|"--serial") serial="true" ;;
            "-ss"|"--slow")
                slow="true"
                [[ "$2" =~ ^[0-9]+([.][0-9]+)?$ ]] && {
                    s_speed="$2"
                    shift
                }
            ;;
        esac
        shift
    done
}

main()
{
    get_args "$@"
    init_colors
    printf "%s" $'\e[2J'

    _coins()
    (
        x_offset="$((i * 14))"

        print_box "5" "3" "12" "12" "${f[$i]}█"
        print_box "4" "4" "13" "11" "${f[$i]}█"
        print_box "13" "6" "13" "9" "${f[$i]}█"
        print_box "7" "12" "10" "12" "${f[$i]}█"

        print_box "10" "4" "10" "11" "${f[0]}█"
        print_box "7" "10" "10" "10" "${f[0]}█"

        print_box "7" "2" "10" "2" "${f[7]}█"
        print_box "5" "3" "7" "3" "${f[7]}█"
        print_box "4" "4" "5" "4" "${f[7]}█"
        print_box "7" "4" "10" "4" "${f[7]}█"
        print_box "3" "5" "3" "9" "${f[7]}█"
        print_box "7" "4" "7" "10" "${f[7]}█"
        print_box "4" "9" "4" "11" "${f[7]}█"
        print_box "5" "11" "5" "11" "${f[7]}█"
    )

    for ((i = 0; i < ${#f[@]}; i++)); do
        if [[ "${serial}" == "true" ]]; then
            _coins
        else
            _coins &
        fi
    done

    [[ "${serial}" != "true" ]] && \
        wait

    printf "%s\\n\\n\\n" "${reset}"
}

[[ "${BASH_SOURCE[0]}" == "$0" ]] && \
    main "$@"
