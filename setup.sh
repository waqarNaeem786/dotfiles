#!/bin/bash

set -e  
set -x  


sudo apt update -y
sudo apt upgrade -y


# CORE UTILITIES
sudo apt install -y \
    wget curl git unzip \
    zsh tmux btop neofetch \
    ripgrep fd-find fzf exa bat \
    xclip wl-clipboard \
    python3 python3-pip python3-venv \
    build-essential gdb cmake ninja-build \
    tldr google-chrome-stable nodejs golang openjdk-17-jdk npm

# zsh installation

if ! command -v zsh &>/dev/null; then
  sudo apt install -y zsh
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Set default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s "$(which zsh)"
fi


tldr --update

# Sway essentials
sudo apt install -y \
    sway swaybg swayidle swaylock \
    bemenu-wayland grim slurp mako-notifier \
    wf-recorder waybar drun wofi terminator

sudo tee /usr/share/wayland-sessions/sway.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Sway
Comment=An i3-compatible Wayland compositor
Exec=sway
Type=Application
DesktopNames=sway
EOF
# EMACS & DEV TOOLS

sudo apt install -y emacs-native-comp

# Language Servers (LSP)
sudo npm install -g \
    bash-language-server \
    pyright \
    vscode-langservers-extracted
# android studio
sudo apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 qemu-kvm
sudo snap install android-studio --classic


# OFF SEC
sudo apt install -y \
    nmap wireshark tcpdump \
    sqlmap zaproxy \
    john hydra \
    radare2 binwalk docker.io docker-compose qemu

# FONTS & MISC
sudo apt install -y fonts-firacode 

# Create config directories
mkdir -p ~/.config/{sway,waybar}
mkdir -p ~/.emacs.d

#moving configs
cp -i .emacs ~/

cp -i sway ~/.config/sway/config
cp -i display.sh ~/.config/sway/
cp -i waybar ~/.config/waybar/config
cp -i style.css ~/.config/waybar/style.css 


sudo apt autoremove -y
sudo apt autoclean -y
