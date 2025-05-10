#zsh
alias cls=clear
alias reload="source ~/.zshrc"
alias zsh="nvim ~/.zshrc"

#wezterm
alias wez="nvim ~/.wezterm.lua"

#neofetch
alias sysinfo="clear && neofetch"

#Homebrew
export PATH="/opt/homebrew/bin:$PATH"


#starship prompt

eval "$(starship init zsh)"


#Vim /Nvim
alias vim=nvim
alias vi=nvim
alias vimdiff="nvim -d"
alias nv="nvim"

#config nvim
alias gvc="cd ~/.config/nvim"

export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Python 
alias python=python3
alias py=python3
alias pip=pip3


#Java
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"


#Git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gb="git branch"
alias gd="git diff"





#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
