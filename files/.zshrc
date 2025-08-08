# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
    git
    docker
    docker-compose
    nvm
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    fzf
    command-not-found
    sudo
    history
    colored-man-pages
    extract
)

# Oh My Zsh settings
DISABLE_AUTO_UPDATE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export EDITOR='nano'
export VISUAL='nano'

# History settings
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'

# Docker aliases
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} 2>/dev/null || cat {}'"

# Auto-suggestions configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^[[Z' autosuggest-accept  # Shift+Tab to accept suggestion

# Syntax highlighting configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# WSL specific settings
if grep -qi microsoft /proc/version; then
    # Windows drives
    hash -d c=/mnt/c
    
    # Copy to Windows clipboard
    alias clip='clip.exe'
    
    # Open Windows Explorer
    alias explorer='explorer.exe .'
    
    # VS Code
    alias code='code.exe'
    export EDITOR='code'
    export VISUAL='code'

    export BROWSER='/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe'
fi

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom functions
mkcd() {
    mkdir -p "$1" && cd "$1"
}

kimi() {
    # Load the key into a variable at runtime
    local SECRETS_FILE="$HOME/.secrets"
    local ANTHROPIC_AUTH_TOKEN

    if [ -f "$SECRETS_FILE" ]; then
        # Source the secrets file in a subshell and extract the key
        ANTHROPIC_AUTH_TOKEN=$(grep ANTHROPIC_AUTH_TOKEN "$SECRETS_FILE" | cut -d '=' -f2- | tr -d '"')
    else
        echo "🔒 Secret file not found: $SECRETS_FILE"
        return 1
    fi

    env \
        ANTHROPIC_AUTH_TOKEN="$ANTHROPIC_AUTH_TOKEN" \
        ANTHROPIC_BASE_URL=https://api.moonshot.ai/anthropic \
        claude "$@"
}

extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Add Claude Code to PATH if installed
export PATH="$HOME/.npm-global/bin:$PATH"
