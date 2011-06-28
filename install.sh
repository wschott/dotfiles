#!/bin/bash

# dotfiles
#
# dotfiles Installer

# Move this directory to ~/.dotfiles if ~/.dotfiles doesn't exist
ROOTDIR=$(dirname $0)

if [ ! -d ~/.dotfiles ]; then
	mv $ROOTDIR ~/.dotfiles
fi

# Symlink every dotfile
for file in bash_profile bashrc gitconfig gitignore inputrc vimrc; do
	if [ -f ~/.$file ]; then
		rm ~/.$file
	fi
	ln -sn ~/.dotfiles/$file ~/.$file
done

echo "install/update localrc.sample file?"
read updatelocalrc
if [ $updatelocalrc == "y" ]; then
	if [ -f ~/.localrc ]; then
			# mv ~/.localrc ~/.localrc.backup
			NOW=$(date +"%Y-%m-%d_%H-%M-%S")
			BACKUPFILE=".localrc.$NOW.backup"
			mv ~/.localrc ~/$BACKUPFILE
	fi
	ln -sn ~/.dotfiles/localrc.sample ~/.localrc
fi

echo "Installation: done"
