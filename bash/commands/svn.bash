#!/bin/bash

# Subversion -----------------------------------------------------------------
export SVN_EDITOR='vim'

alias s='svn'
alias smv='svn move'
alias srm='svn delete'
alias sa='svn add'
alias sc='svn commit'
alias sco='svn checkout'
# alias sd='svn diff -r'
alias sd="svn diff | $EDITOR -"
alias sl='svn log --limit 10'
alias sll='svn log | less'
alias sup='svn update'
alias supi='svn update --ignore-externals'
alias sst='svn status'
alias ssti='svn status --ignore-externals'
alias svncheck='svn status -u | grep -v "^\?"'
alias svnclean='find . -type d -name .svn -exec rm -rf {} \;'
