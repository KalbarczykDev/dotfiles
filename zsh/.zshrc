#TODO: Separate to zshprofile and zshrc

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
venv() {
  if [ -f .venv/bin/activate ]; then
    source .venv/bin/activate
    echo "Activated .venv"
  else
    echo "No .venv found in $(pwd)"
  fi
}

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"




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

# Use C++17
export CXXFLAGS="-std=c++17 -stdlib=libc++"
export CFLAGS="-isysroot $(xcrun --show-sdk-path)"

# Set PKG_CONFIG_PATH for jpeg and ICU
export PKG_CONFIG_PATH="/opt/homebrew/opt/jpeg/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/homebrew/opt/icu4c@77/lib/pkgconfig"

# Set PHP build options
export PHP_BUILD_CONFIGURE_OPTS="--with-zlib-dir=$(brew --prefix zlib) \
  --with-bz2=$(brew --prefix bzip2) \
  --with-curl=$(brew --prefix curl) \
  --with-iconv=$(brew --prefix libiconv) \
  --with-libedit=$(brew --prefix libedit) \
  --with-tidy=$(brew --prefix tidy-html5)"

# Set up phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"


#jenv (java version manager) 
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#chrome debug session (mac only)
alias chbug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  --user-data-dir=/tmp/chrome-debug-profile \
  http://localhost:3000'

#remove bg location
alias rmbg="~/Programming/remove-bg/app.py"

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

