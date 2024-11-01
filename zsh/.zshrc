# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# homebrew
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
eval "$(brew shellenv)"

# auto completions
autoload -Uz compinit
compinit

# zsh config
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

# zsh addons
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# 3rd party apps
eval "$(direnv hook zsh)"
source $(brew --prefix asdf)/libexec/asdf.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='code'
fi

alias ..="cd .."
alias ...="cd ../.."
alias l="ls -lah"

alias config="$EDITOR $HOME/.dotfiles"
alias reload="source $HOME/.zshrc"

# git
alias gs="git status --short --branch --untracked-files"
alias ga="git add"
alias gc="git commit -m"
alias gpl="git pull"
alias gps="git push"
alias gm="git merge"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gst="git stash"
alias gstl="git stash list"
alias glg="git log --graph --oneline --decorate --all"

# custom apps
alias ls="eza"
alias cat="bat"
alias vim="nvim"
alias lg="lazygit"
alias grep="rg"

# macOS specific
# /via https://github.com/holman/dotfiles/blob/master/system/keys.zsh
alias pubkey='more ~/.ssh/id_rsa.pub | pbcopy | echo "=> Public key copied to pasteboard."'

# private dotfiles
if [[ -f $HOME/.local.dotfiles/zshrc ]]; then
    source $HOME/.local.dotfiles/zshrc
fi
