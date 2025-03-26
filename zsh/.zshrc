# Powerlevel10k - Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k - Setup
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PATH="$PATH:/Users/kanakotjapan/worldbanc/private/bin"
