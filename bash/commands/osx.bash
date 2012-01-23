# Mac OS X aliases -----------------------------------------------------------
# open either $1 or current folder
o() {
    command open "${1:-"."}"
}

# Show/hide hidden files in Finder
# /via https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
alias show='defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder'
alias hide='defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder'
