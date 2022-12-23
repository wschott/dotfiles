#!/bin/zsh

BREWS_FILE="$HOME/.dotfiles/brews"

BREWS=("${(@f)"$(< $BREWS_FILE)"}")

for brew in $BREWS; do
    # skip comments
    if [[ $brew != \#* ]]; then
        brew install $brew
    fi
done


CASKS_FILE="$HOME/.dotfiles/brew-casks"

CASKS=("${(@f)"$(< $CASKS_FILE)"}")

for cask in $CASKS; do
    # skip comments
    if [[ $cask != \#* ]]; then
        brew install --cask $cask
    fi
done
