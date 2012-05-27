#!/bin/bash

# assumes ~/.dotfiles is *ours*

# specify files to symlink ---------------------------------------------------
FILES='.ackrc .bash_profile .bashrc .gitconfig .gitignore .inputrc .vim .vimrc .gvimrc bin'


# global vars ----------------------------------------------------------------
NOW=$(date +"%Y-%m-%d_%H-%M-%S")

# backup old .dotfiles -------------------------------------------------------
_backup() {
    if [[ -d ~/.dotfiles ]]; then
        local ZIPFILE=".dotfiles-backup-$NOW.zip"
        echo "  to file: $ZIPFILE"
        zip -rq ~/$ZIPFILE ~/.dotfiles
    fi
}

# install new .dotfiles ------------------------------------------------------
_installation() {
    # symlink files
    for long in $FILES; do
        # assume file doesn't start with a dot
        short=$long
        if [[ ${long:0:1} == '.' ]]; then
            # current file starts with a dot
            short=${long:1}
        fi

        local s=''
        if [[ -f ~/$long || -d ~/$long ]]; then
            # backup if user has this file
            s=" | backup at: ~/.dotfiles-backup-$NOW-symlinks/$long"
            mkdir -p ~/.dotfiles-backup-$NOW-symlinks/
            mv ~/$long ~/.dotfiles-backup-$NOW-symlinks/$long
        fi

        echo "  symlink: ~/${long}${s}"
        ln -s ~/.dotfiles/$short ~/$long
    done

    mkdir -p ~/.local.dotfiles/

    # copy local .bashrc sample file if user has none
    if [[ ! -f ~/.local.dotfiles/bashrc ]]; then
        cp ~/.dotfiles/local/bashrc.sample ~/.local.dotfiles/bashrc
    fi
    # copy local .vimrc sample file if user has none
    if [[ ! -f ~/.local.dotfiles/vimrc ]]; then
        cp ~/.dotfiles/local/vimrc.sample ~/.local.dotfiles/vimrc
    fi
    # copy local .gvimrc sample file if user has none
    if [[ ! -f ~/.local.dotfiles/gvimrc ]]; then
        cp ~/.dotfiles/local/gvimrc.sample ~/.local.dotfiles/gvimrc
    fi
}

# Installation steps ---------------------------------------------------------
current_pwd=$(pwd)

if [[ -d ~/.dotfiles ]]; then
    echo 'Backup ~/.dotfiles'
    _backup
fi

if [[ -d ~/.dotfiles/.git ]]; then
    echo 'Updating'
    cd ~/.dotfiles
    git pull origin master
else
    echo 'Downloading'
    git clone git://github.com/wschott/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
fi

echo 'Installing'
_installation

cd $current_pwd
echo 'Done'
echo "  don't forget to 'source ~/.bashrc'"
