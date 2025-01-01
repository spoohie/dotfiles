apps=(
    alt-tab
    bettertouchtool
    cursor
    docker
    firefox
    flux
    google-chrome
    itsycal
    microsoft-outlook
    microsoft-teams
    notion
    raycast
    slack
    spotify
    warp
)

mas_apps=(
    "1452453066"  # Hidden Bar         (1.8)
    "985367838"   # Microsoft Outlook  (16.92)
    "1352778147"  # Bitwarden          (2024.12.1)
)

install_macos_apps() {
    info "Installing macOS apps..."
    install_brew_casks "${apps[@]}"
}

install_masApps() {
    info "Installing App Store apps..."
    for app in "${mas_apps[@]}"; do
        mas install "$app"
    done
}