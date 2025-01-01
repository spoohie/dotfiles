#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. apps.sh
. brew.sh
. config.sh
. fonts.sh
. osx.sh
. packages.sh
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
    info "Homebrew Packages"
    info "################################################################################"
    wait_input
    install_packages

    post_install_packages
    success "Finished installing Homebrew packages"

    info "################################################################################"
    info "Homebrew Fonts"
    info "################################################################################"
    wait_input
    install_fonts
    success "Finished installing fonts"

    info "################################################################################"
    info "MacOS Apps"
    info "################################################################################"
    wait_input
    install_macos_apps

    install_masApps
    success "Finished installing macOS apps"

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