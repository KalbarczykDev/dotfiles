#TODO: Clean up

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

#docker

alias docker-rebuild="docker compose down -v && docker compose up --build"

#spring boot
spring-run() {
  if [ -f "./mvnw" ]; then
    ./mvnw spring-boot:run
  elif [ -f "./gradlew" ]; then
    ./gradlew bootRun
  else
    echo "No Maven or Gradle wrapper found in this directory."
  fi
}

#gradlew
alias gradle-run="./gradlew run"
alias gradle-test="./gradlew test"
alias gradle-clean="./gradlew clean"
alias gradle-build="./gradlew clean build"
alias gradle-build-skip-tests="./gradlew build -x test"
alias gradle-deps="./gradlew dependencies"
alias gradle-refresh="./gradlew --refresh-dependencies"
alias gradle-watch="./gradlew build --continuous"

#mvnw 
alias mvn-run="./mvnw exec:java"
alias mvn-test="./mvnw test"
alias mvn-clean="./mvnw clean"
alias mvn-build="./mvnw clean install"
alias mvn-build-skip-tests="./mvnw clean install -DskipTests"
alias mvn-deps="./mvnw dependency:tree"
alias mvn-refresh="./mvnw clean install -U"



#chrome debug session (mac only)
alias chbug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  --user-data-dir=/tmp/chrome-debug-profile \
  http://localhost:3000'


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


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#jenv (java version manager) 
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Created by `pipx` on 2025-07-06 15:17:35
export PATH="$PATH:/Users/oskalbarczyk/.local/bin"
