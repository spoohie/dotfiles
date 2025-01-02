#!/usr/bin/env bash

cleanup() {
    err "Last command failed"
    info "Finishing..."
}

wait_input() {
    read -p -r "Press enter to continue: "
}

reset_color=$(tput sgr 0)

info() {
    printf "%s[*] %s%s\n" "$(tput setaf 4)" "$1" "$reset_color"
}

success() {
    printf "%s[*] %s%s\n" "$(tput setaf 2)" "$1" "$reset_color"
}

err() {
    printf "%s[*] %s%s\n" "$(tput setaf 1)" "$1" "$reset_color"
}

warn() {
    printf "%s[*] %s%s\n" "$(tput setaf 3)" "$1" "$reset_color"
}