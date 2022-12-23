#!/bin/bash

# remove all symlinks to these dotfiles

FILES='.ackrc .gitconfig .gitignore .vim .vimrc .gvimrc .zshrc bin'

for file in $FILES; do
    # is file a symlink?
    if [[ -L $HOME/$file ]]; then
        rm $HOME/$file
    fi
done
