# Detect OS
OS="$(uname)"

# Homebrew
if [ "$OS" = "Darwin" ]; then
  export PATH="/opt/homebrew/bin:$PATH"
elif [ "$OS" = "Linux" ] && [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

#dotfiles 
alias dot="cd ~/.dotfiles"

#zsh
alias cls=clear
alias reload="source ~/.zshrc"
alias zsh="nvim ~/.zshrc"

#wezterm
alias wez="nvim ~/.wezterm.lua"

#neofetch
alias sysinfo="clear && neofetch"


#cargo (rust)
export PATH="$HOME/.cargo/bin:$PATH"

#lunarvim

export PATH="$HOME/.local/bin/":$PATH


#starship prompt

eval "$(starship init zsh)"

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH="$(npm bin -g):$PATH"

#Vim /Nvim
alias vim=nvim
alias vi=nvim
alias v=nvim
alias nv=nvim 

#config nvim
alias gvc="cd ~/.config/nvim"
alias vc="nvim ~/.config/nvim"

export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Python 
alias python=python3
alias py=python3
alias pip=pip3


# Java
if [ "$OS" = "Darwin" ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
elif [ "$OS" = "Linux" ] && [ -d "/usr/lib/jvm" ]; then
  export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))
fi
export PATH="$JAVA_HOME/bin:$PATH"


#Git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gb="git branch"
alias gd="git diff"

# Zsh Autosuggestions
if [ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Zsh Syntax Highlighting (must be last)
if [ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
