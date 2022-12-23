#!/bin/bash

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show POSIX Path in Finder Window Title
#defaults write com.apple.finder _FXShowPosixPathInTitle YES

# Show Path Bar in Finder
defaults write com.apple.finder ShowPathBar -boolean YES

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Mimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Show up hidden dock faster
defaults write com.apple.Dock autohide-delay -float 0

# Enable copy and paste in Quicklook windows
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
defaults write com.apple.Mail QLEnableTextSelection -bool TRUE

# Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Kill affected applications
for app in Safari Finder Dock Mail; do killall "$app"; done
