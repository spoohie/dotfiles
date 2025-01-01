taps=(
    homebrew/cask
)

packages=(
    awscli
    bat        # https://github.com/sharkdp/bat
    bitwarden-cli
    duti
    eza        # https://github.com/eza-community/eza
    fzf        # https://github.com/junegunn/fzf
    git-delta
    gh
    jq
    less
    make
    mas        # https://github.com/mas-cli/mas
    node
    python3
    ripgrep    # https://github.com/BurntSushi/ripgre
    ruff
    starship
    stow
    uv
    wget
    zinit      # https://github.com/zdharma-continuum/zinit
    zoxide     # https://github.com/ajeetdsouza/zoxide
)

fonts=(
    font-fira-code-nerd-font
    font-hack-nerd-font
)

install_packages() {
    info "Configuring taps"
    apply_brew_taps "${taps[@]}"

    info "Installing packages..."
    install_brew_formulas "${packages[@]}"

    info "Installing fonts..."
    install_brew_casks "${fonts[@]}"

    info "Cleaning up brew packages..."
    brew cleanup
}

post_install_packages() {
    info "Installing fzf bindings"
    # shellcheck disable=SC2046
    $(brew --prefix)/opt/fzf/install
}