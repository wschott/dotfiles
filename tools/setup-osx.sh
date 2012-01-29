#!/bin/bash

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Show the ~/Library folder
chflags nohidden ~/Library

# Show POSIX Path in Finder Window Title
#defaults write com.apple.finder _FXShowPosixPathInTitle YES

# Show Path Bar in Finder
defaults write com.apple.finder ShowPathBar -boolean YES

# Make hidden applications transparent
defaults write com.apple.Dock showhidden -bool true

# show folder previews in quicklook
#defaults write com.apple.finder QLEnableXRayFolders 1

# Enable copy and paste in Quicklook windows
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
defaults write com.apple.Mail QLEnableTextSelection -bool TRUE

# Kill affected applications
for app in Safari Finder Dock Mail; do killall "$app"; done
