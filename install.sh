#!/bin/bash

# assumes ~/.dotfiles is *ours*

# specify files to symlink ---------------------------------------------------
FILES='.bash_profile .bashrc .gitconfig .gitignore .inputrc .vim .vimrc bin'


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
		
		if [[ -f ~/$long || -d ~/$long ]]; then
			# backup if user has this file
			mkdir -p ~/.dotfiles-backup-$NOW-symlinks/
			mv ~/$long ~/.dotfiles-backup-$NOW-symlinks/$long
		fi
		
		echo "  symlink: ~/$long | backup at: ~/.dotfiles-backup-$NOW-symlinks/$long"
		ln -s ~/.dotfiles/$short ~/$long
	done

	# copy .localrc sample file if user has none
	if [[ ! -f ~/.localrc ]]; then
		cp ~/.dotfiles/localrc.sample ~/.localrc
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
