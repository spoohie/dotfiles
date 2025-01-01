stow_dotfiles() {
    local files=(
        ".config/gh/config.yml"
        ".config/starship.toml"
        ".gitconfig"
        "Library/Application Support/Cursor/User/keybindings.json"
        "Library/Application Support/Cursor/User/settings.json"
        ".ruff.toml"
        ".vimrc"
        ".zprofile"
        ".zshenv"
        ".zshrc"
    )

    info "Removing existing config files"
    for f in "${files[@]}"; do
        rm -f "$HOME/$f" || true
    done

    # shellcheck disable=SC2155
    local to_stow="$(find stow -maxdepth 1 -type d -mindepth 1 | awk -F "/" '{print $NF}' ORS=' ')"
    info "Stowing: $to_stow"
    stow -d stow --verbose 1 --target "$HOME" "$to_stow"
}