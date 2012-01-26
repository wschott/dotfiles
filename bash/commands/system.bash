#!/bin/bash

# Helper ---------------------------------------------------------------------
alias df='df -h'                        # human sizes
alias e="$EDITOR"                       # edit
alias et="$EDITOR ."                    # edit this
alias etb="$EDITOR . &"                 # edit this in background


# File aliases ---------------------------------------------------------------
alias hosts="sudo $EDITOR /etc/hosts"   # edit /etc/hosts
alias ebash="$EDITOR ~/.dotfiles"       # edit these files
alias rbash='source ~/.bashrc'          # reload these files


# Directory Changing aliases -------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'


# File Listing aliases -------------------------------------------------------
# -A : all files & folders except . & ..
# -F : display extra info for items: / (folders), * (executable), @ (symlink)
# -h : human file sizes


#if [[ $(uname) == "Darwin" ]]; then
#   BASH_LS_OPTIONS=='-G'
#else
#   BASH_LS_OPTIONS='--color=auto'
#fi
#alias ls="ls -AFh $BASH_LS_OPTIONS"


if [[ $(uname) == 'Darwin' ]]; then
    # G = enable colors
    #export CLICOLOR=1
    alias ls='ls -FhG'                     # overwrite default ls
    alias l='ls -1'                      # as list w/o details
else
    #alias ls="ls -AFh --color=auto"        # overwrite default ls
    alias ls="ls -Fh $LS_OPTIONS"          # overwrite default ls
    alias l='ls -1 --ignore "*.pyc"'     # as list w/o details
fi
alias ll='ls -A1'               # everythin as list w/o details
alias la='ls -lA'                # everything as list w/ details
alias lla='ls -lA'                # everything as list w/ details
alias lsdir='ls -lA | grep "^d"'  # only folders
alias l.='ls -lAd .*'           # only files/folders starting with a . (dot)

# File Handling aliases ------------------------------------------------------
alias mkdir='mkdir -p -v'       # make directory tree
alias md='mkdir -p'             # make directory tree
alias rm='rm -i'                # prompt before deleting
# alias cp='cp -i'              # prompt before overwriting
# alias mv='mv -i'              # prompt before overwriting


# Application aliases --------------------------------------------------------
alias nano='command vim'                # get rid of nano
alias vi='command vim'                  # get rid of vi
alias v='vim'


# System monitoring ----------------------------------------------------------
alias topc='top -o cpu'                 # sort top by cpu usage
alias topm='top -o rsize'               # sort top by memory usage
alias topcpu='ps aux | sort -k3,3n | tail -10'      # top 10 cpu processes
alias topmem='ps aux | sort -k4,4n | tail -10'      # top 10 memory processes
# alias apache_process='ps -ef | grep apache | grep -v grep | wc -l'


# Searching helper -----------------------------------------------------------
alias grep='grep --color'

# delds: removes all .DS_Store file from the current dir and below
alias delds='find . -type f -name ".DS_Store" -print0 | xargs -0 rm'
alias delpyc='find . -type f -name "*.pyc" -print0 | xargs -0 rm'


# /via https://github.com/holman/dotfiles/blob/master/system/keys.zsh
alias pubkey='more ~/.ssh/id_rsa.pub | pbcopy | echo "=> Public key copied to pasteboard."'
