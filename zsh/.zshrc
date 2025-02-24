# docs: https://zsh-manual.netlify.app/the-z-shell-manual

# Homebrew
if [[ -e /opt/homebrew/bin/brew ]]; then
    # apple silicon cpu
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    # intel cpu
    eval "$(/usr/local/bin/brew shellenv)"
fi

# PATH
export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/openjdk/bin:$PATH"

# homebrew
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh

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
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 3rd party apps
eval "$(direnv hook zsh)"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

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
