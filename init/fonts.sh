fonts=(
    font-fira-code-nerd-font
    font-hack-nerd-font
)

install_fonts() {
    info "Installing fonts..."
    brew tap homebrew/cask
    install_brew_casks "${fonts[@]}"
}