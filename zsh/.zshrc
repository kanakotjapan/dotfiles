# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_CUSTOM=$HOME/.config/zsh/custom
ZSH_THEME="fwalch"

DISABLE_AUTO_TITLE="true"
DISABLE_LS_COLORS="true"

plugins=(
    git
    vi-mode
    zsh-syntax-highlighting
    zsh-you-should-use
    fzf
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias n='nvim .'
alias ls='eza'
alias ll='ls -lh --git --icons=always'
alias lla='ll -a'
alias lg="lazygit"
alias reload="source ~/.zshrc"

