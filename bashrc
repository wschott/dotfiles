#!/bin/bash

if [[ -z "$PS1" ]]; then
    return
fi

# Set default prompt -----------------------------------------------------
export PS1='\[\e[0;31m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$\[\e[m\] '

source ~/.dotfiles/bash_prompt          # setup custom prompt


if [[ $(uname) != 'Darwin' ]]; then
    setterm -blength                        # turn beeps off on a non OSX OS
fi

# PATHs ----------------------------------------------------------------------
export PATH="/usr/local/bin:$PATH"  # expand default PATH
export PATH="/usr/local/sbin:$PATH" # expand default PATH
export PATH="~/bin:$PATH"           # add users ~/bin to PATH
# History --------------------------------------------------------------------
export HISTSIZE=65536               # longer shell history
export HISTFILESIZE=65536           # even longer history file (for lookups)
export HISTCONTROL=ignoredups       # ignore duplicates if typed more than once
export HISTIGNORE='l:ll:cd:cd ..:cd ../..:..:...'   # these commands won't be added to the history
# Misc -----------------------------------------------------------------------
export EDITOR='vim'                 # set default editor
export INPUTRC=~/.inputrc           # overwrite default bash shortcuts
shopt -s cmdhist                    # save multi-line commands in history as single line
shopt -s checkwinsize               # after each command & update LINES & COLUMNS


# vi mode in bash ------------------------------------------------------------
set -o vi
bind -m vi-insert "\C-a":beginning-of-line
bind -m vi-insert "\C-e":end-of-line


# Import private .localrc ----------------------------------------------------
# It's important to import .localrc before other aliases in order to overwrite
# the default editor
if [[ -f ~/.local.dotfiles/bashrc ]]; then
    source ~/.local.dotfiles/bashrc
fi

# import alias files ---------------------------------------------------------
for file in ~/.dotfiles/bash/commands/*.bash; do
    source $file
done

# import completion files ----------------------------------------------------
for file in ~/.dotfiles/bash/completion/*.bash; do
    source $file
done

# remove duplicates from PATH at last
export PATH=$(awk -F: '{for(i=1;i<=NF;i++){if(!($i in a)){a[$i];printf s$i;s=":"}}}'<<<$PATH)

# Import private .localrc again ----------------------------------------------
# It's important to import .localrc at the end again in order to overwrite
# the aliases with custom the user's aliases
if [[ -f ~/.local.dotfiles/bashrc ]]; then
    source ~/.local.dotfiles/bashrc
fi
