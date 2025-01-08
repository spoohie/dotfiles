setup_osx() {
    info "Configuring MacOS default settings"

    # Finder settings
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false       # Hide external hard drives on desktop
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false               # Hide hard drives on desktop
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false           # Hide removable media hard drives on desktop
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool false           # Hide mounted servers on desktop
    defaults write com.apple.finder ShowPathbar -bool true                            # Show path bar
    defaults write com.apple.finder "AppleShowAllFiles" -bool true                    # Show hidden files inside the finder
    defaults write com.apple.finder "ShowStatusBar" -bool true                        # Show Status Bar
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false        # Do not show warning when changing the file extension
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"               # Set search scope to current folder
    defaults write com.apple.Finder FXPreferredViewStyle Nlsv                         # Always open everything in Finder's list view

    # Dock settings
    defaults write com.apple.dock static-only -bool true                              # Have the Dock show only active apps
    defaults write com.apple.dock autohide -bool true                                 # Enable Dock autohide
    defaults write com.apple.dock autohide-delay -float 0                             # Set Dock autohide delay
    defaults write com.apple.dock autohide-time-modifier -float 0.4                   # Set Dock autohide animation delay
    killall Dock

    # Desktop services
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true      # Avoid creating .DS_Store files on network volumes

    # Screenshot settings
    defaults write com.apple.screencapture type -string "png"                         # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)

    # Software update settings
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 7                  # Set weekly software update checks

    # Mouse settings
    defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string "TwoButton" # Secondary click in external mouse

    # Launch services settings
    defaults write com.apple.LaunchServices LSQuarantine -bool false                  # Disable the “Are you sure you want to open this application?” dialog

    # Typing settings
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false     # Disable smart quotes

    # Show the ~/Library folder
    chflags nohidden ~/Library
}
