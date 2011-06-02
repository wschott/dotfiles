# dotfiles
#
# The core system

# Set command prompt to "~/working/directory $"
PS1="\w $ "

# Set default editor
export EDITOR="mate"

# Expand default PATH
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

if [ -d ~/bin ]; then
	PATH="~/bin:$PATH"
fi

# Set colors
export CLICOLOR=1

# sudo Auto Completion
complete -cf sudo

# SSH Auto Completion of Remote Hosts
#SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | egrep -v [0123456789]) )
#complete -o default -W "${SSH_COMPLETE[*]}" ssh

# Helper
alias s="source"
alias c="clear"
alias h="history 25"
alias df="df -h"

alias clean="rm -f *.~*"

# Performance
alias topc="top -o cpu"
alias topm="top -o vsize"

# File Aliases
alias hosts="$EDITOR /etc/hosts"
alias ebash="$EDITOR ~/.bashrc"
alias rbash="source ~/.bashrc"
alias erbash="$EDITOR ~/.bashrc && source ~/.bashrc"

# Import alias files
for script in ~/.dotfiles/aliases/*.alias; do
	source $script
done

export PATH

# Import private .localrc
if [ -f ~/.localrc ]; then
	. ~/.localrc
fi
