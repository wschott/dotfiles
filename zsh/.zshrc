# docs: https://zsh-manual.netlify.app/the-z-shell-manual

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
setopt hist_reduce_blanks
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
HISTORY_IGNORE="ls|l|ll|la|lla|cd|cd ..|cd ../..|..|..."

# zsh addons
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
alias ....="cd ../../.."

alias md='mkdir -p'
alias l="ls -lah"
alias lt="eza -lT --level=1"
alias lt2="eza -lT --level=2"

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
alias cd="z"
alias vim="nvim"
alias gg="lazygit"
alias grep="rg"

# macOS specific
# /via https://github.com/holman/dotfiles/blob/master/system/keys.zsh
alias pubkey='more ~/.ssh/id_rsa.pub | pbcopy | echo "=> Public key copied to pasteboard."'

# private dotfiles
if [[ -f $HOME/.local.dotfiles/zshrc ]]; then
    source $HOME/.local.dotfiles/zshrc
fi
