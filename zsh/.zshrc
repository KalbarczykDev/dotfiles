#homebrew
export PATH="/opt/homebrew/bin:$PATH"

#starship prompt
eval "$(starship init zsh)"

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH="$(npm bin -g):$PATH"

#config nvim
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#Aliases

#Vim
alias gvc="cd ~/.config/nvim"
alias vim=nvim
alias vi=nvim
alias v=nvim
alias nv=nvim

#Python
alias python=python3
alias py=python3
alias pip=pip3

#Git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gb="git branch"
alias gd="git diff"

#zsh
alias reload="source ~/.zshrc"
alias zsh="nvim ~/.zshrc"

#PHP
function phpserve {
  local dir="${1:-.}"
  php -S localhost:8000 -t "$dir"
}

function phpdebug {
  local dir="${1:-.}"
  php \
    -dxdebug.mode=debug \
    -dxdebug.start_with_request=yes \
    -dxdebug.discover_client_host=true \
    -dxdebug.client_host=127.0.0.1 \
    -dxdebug.client_port=9003 \
    -S localhost:8000 \
    -t "$dir"
}

#mysql
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

#misc
alias lah="ls -lah"
alias gotop="clear && gotop"
alias cls=clear
alias dot="cd ~/.dotfiles"
alias fastfetch="clear && fastfetch"
alias matrix="cmatrix"
# Zsh Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh Syntax Highlighting (must be last)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
