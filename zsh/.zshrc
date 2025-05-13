
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.zshrc_custom ]] && source ~/.zshrc_custom
