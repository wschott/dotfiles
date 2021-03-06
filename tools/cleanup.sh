#!/bin/bash

# remove all symlinks to these dotfiles

FILES='.ackrc .bash_profile .bashrc .gitconfig .gitignore .inputrc .vim .vimrc .gvimrc bin'

for file in $FILES; do
    # is file a symlink?
    if [[ -L ~/$file ]]; then
        rm ~/$file
    fi
done
