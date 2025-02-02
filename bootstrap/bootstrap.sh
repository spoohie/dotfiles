#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. brew.sh
. config.sh
. osx.sh
. utils.sh

bootstrap() {
    trap cleanup SIGINT SIGTERM ERR EXIT

    info "Installing ..."

    info "################################################################################"
    info "Homebrew bundle"
    info "################################################################################"
    wait_input
    install_homebrew_bundle

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

# Check if the script is being executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    bootstrap
fi