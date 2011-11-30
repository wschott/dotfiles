# Helper ---------------------------------------------------------------------
alias c='clear'							# clear scrollback
alias h='history 25'					# show last 25 commands
alias df='df -h'						# human sizes
alias e="$EDITOR"						# edit
alias et="$EDITOR ."					# edit this
alias etb="$EDITOR . &"					# edit this in background
# alias clean='rm -f *.~*'


# File aliases ---------------------------------------------------------------
alias hosts="sudo $EDITOR /etc/hosts"	# edit /etc/hosts
alias ebash="$EDITOR ~/.dotfiles"		# edit these files
alias rbash='source ~/.bashrc'			# reload these files
alias erbash="$EDITOR ~/.dotfiles && source ~/.bashrc"	# edit & reload these files


# Directory Changing aliases -------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias back='cd -'				# jump to last working directory


# File Listing aliases -------------------------------------------------------
# A = all files & folders except . & ..
# F = display extra info for items: / (folders), * (executable), @ (symlink)
# h = human file sizes
# G = enable colors
alias ls='ls -AFhG'				# overwrite default ls
alias l='ls -lA'
alias ll='ls -l'				# as list
alias la='ls -A'				# everything
alias lla='ls -lA'				# everything as list
alias lsd='ls -lA | grep "^d"'	# only folders
alias l.='ls -lAd .*'			# only files/folders starting with a . (dot)

# File Handling aliases ------------------------------------------------------
alias mkdir='mkdir -p -v'		# make directory tree
# alias md='mkdir -p'			# make directory tree
alias rm='rm -i'				# prompt before deleting
# alias cp='cp -i'				# prompt before overwriting
# alias mv='mv -i'				# prompt before overwriting


# Application aliases --------------------------------------------------------
alias nano='vim'				# get rid of nano
alias vi='vim'					# get rid of vi
alias v='vim'


# Mac OS X aliases -----------------------------------------------------------
alias o='open .' 				# open this folder in Finder.app
alias m='mate'					# TextMate

# Show/hide hidden files in Finder
# /via https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
alias show='defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder'
alias hide='defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder'


# System monitoring ----------------------------------------------------------
alias topc='top -o cpu'					# sort top by cpu usage
alias topm='top -o rsize'				# sort top by memory usage
alias topcpu='ps aux | sort -k3,3n | tail -10'		# top 10 cpu processes
alias topmem='ps aux | sort -k4,4n | tail -10'		# top 10 memory processes
# alias apache_process='ps -ef | grep apache | grep -v grep | wc -l'


# Searching helper -----------------------------------------------------------
alias grep='grep --color'

# dsrm: removes all .DS_Store file from the current dir and below
alias rmds='find . -type f -name ".DS_Store" -print0 | xargs -0 rm'
alias rmpyc='find . -type f -name "*.pyc" -print0 | xargs -0 rm'


# auto completion for ~/code/ subdirectories
complete -C ~/.dotfiles/completion/project_completion -o default c

# changing directory to code project
c() { cd ~/code/"$1"; }


# /via https://github.com/holman/dotfiles/blob/master/system/keys.zsh
alias pubkey='more ~/.ssh/id_rsa.pub | pbcopy | echo "=> Public key copied to pasteboard."'
