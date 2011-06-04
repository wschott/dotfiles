# dotfiles
#
# The core system

# Set command prompt to "~/working/directory (git-branch) $"
PS1='\w$(__git_ps1 " (%s)") $ ' # \u@\h

# Set default editor
export EDITOR="vim"

# Expand default PATH
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add users ~/bin to PATH
if [ -d ~/bin ]; then
	PATH="~/bin:$PATH"
fi

export PATH

# Set colors
export CLICOLOR=1


# Import private .localrc
# It's important to import .localrc before other aliases in order to overwrite the default editor
if [ -f ~/.localrc ]; then
	. ~/.localrc
fi


# Import alias files
for script in ~/.dotfiles/aliases/*.alias; do
	source $script
done

# Import completion files
for script in ~/.dotfiles/completion/*.bash; do
	source $script
done

# sudo Auto Completion
complete -cf sudo
