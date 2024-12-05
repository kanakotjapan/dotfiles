# Plugins
source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ls='eza'
alias ll='ls -lh --git --icons=always'
alias lla='ll -a'

# Aliases - git
alias gst="git status"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias ga="git add"
alias gaa="git add --all"
alias gf="git fetch"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"

