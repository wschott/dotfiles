# Git ------------------------------------------------------------------------
alias g='git'
alias gmv='git mv'
alias grm='git rm'
alias ga='git add -A'
alias gaa='git add -A && git status --short --branch'
alias gc='git commit'	# -v = verbose
alias gd="git diff | $EDITOR -"				# What's changed but not yet added?
alias gdc="git diff --cached | $EDITOR -"	# What's added but not yet committed?
alias gl="git log --graph --pretty=format1 --abbrev-commit --date=relative"
alias gpl='git pull'
alias gps='git push'
alias gst='git status --short --branch'
# alias gstl='git status'
alias gb='git branch'
alias gba='git branch -a'
alias gt='git tag'
alias gm='git merge'
alias gco='git checkout'
alias gitclean='find . -name .git -exec rm -rf {} \;'
alias gsvn='git svn'
alias gi='git init && printf ".DS_Store\n*.swp\n" >> .gitignore && git add .gitignore && gst'
alias gunstage='git reset HEAD --'
alias guncommit='git reset --soft HEAD^'	# Undo your last commit, but don't throw away your changes
alias grmold="git status | grep deleted | awk '{print $3}' | xargs git rm"
alias gwho='git shortlog -s -n --no-merges'
alias gstandup='git shortlog --since=yesterday'
alias gtoday='git shortlog --since=midnight'
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'


# Add git aliases to bash completion -----------------------------------------
complete -o default -o nospace -F _git_add ga
complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_tag gt
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_commit gc
complete -o default -o nospace -F _git_diff gd
complete -o default -o nospace -F _git_log gl
complete -o default -o nospace -F _git_pull gpl
complete -o default -o nospace -F _git_push gps
