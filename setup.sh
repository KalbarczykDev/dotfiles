#!/bin/bash

set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing required packages..."
sudo apt install -y \
  curl \
  gcc \
  git \
  gradle \
  grep \
  gotop \
  make \
  maven \
  neofetch \
  neovim \
  python3 \
  python3-pip \
  pipx \
  ripgrep \
  starship \
  stow \
  tmux \
  tree \
  zsh \
  npm \
  nodejs \
  cargo \
  unzip \
  build-essential


if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Setting Zsh as the default shell..."
  chsh -s $(which zsh)
else
  echo "Zsh is already the default shell."
fi


echo "Ensuring pipx is in PATH..."
pipx ensurepath

echo "Installing zsh-autosuggestions..."
mkdir -p ~/.zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions

echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting



echo "Installing WezTerm..."
curl -LO https://github.com/wez/wezterm/releases/latest/download/wezterm-ubuntu20.04.deb
sudo apt install -y ./wezterm-ubuntu20.04.deb
rm wezterm-ubuntu20.04.deb

echo "Cloning dotfiles..."
git clone https://github.com/KalbarczykDev/dotfiles ~/.dotfiles

echo "Linking dotfiles with stow..."
cd ~/.dotfiles
for dir in *; do
  [ -d "$dir" ] && stow "$dir"
done

echo "Installing JetBrainsMono Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# Download and extract only JetBrainsMonoNL Nerd Font
curl -Lo JetBrainsMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
unzip -o JetBrainsMono.zip -d "$FONT_DIR"
rm JetBrainsMono.zip

# Rebuild font cache
fc-cache -fv

#Applications

echo "Installing Discord..."
curl -LO https://discord.com/api/download?platform=linux&format=deb -o discord.deb
sudo apt install -y ./discord.deb
rm discord.deb

echo "Installing OBS Studio..."
sudo apt install -y ffmpeg obs-studio



echo "Setup complete. Start a new shell or run 'exec zsh' to apply changes."

