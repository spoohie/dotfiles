#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. brew.sh
. config.sh
. osx.sh
. utils.sh

cleanup() {
    err "Last command failed"
    info "Finishing..."
}

wait_input() {
    read -p -r "Press enter to continue: "
}

main() {
    info "Installing ..."

    info "################################################################################"
    info "Homebrew bundle"
    info "################################################################################"
    wait_input
    install_brewfile

    success "Finished installing Homebrew bundle"

    info "################################################################################"
    info "Configuration"
    info "################################################################################"
    wait_input

    setup_osx
    success "Finished configuring MacOS defaults. NOTE: A restart is needed"

    stow_dotfiles
    success "Finished stowing dotfiles"

    success "Done"

    info "System needs to restart. Restart?"

    select yn in "y" "n"; do
        case $yn in
        y)
            sudo shutdown -r now
            break
            ;;
        n) exit ;;
        esac
    done
}

trap cleanup SIGINT SIGTERM ERR EXIT

main