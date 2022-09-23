#!/usr/bin/env bash
echo -ne "
----------------------------------------------------------------
 ██╗     ██╗██████╗ ██████╗ ██╗ ██████╗██╗  ██╗
 ██║     ██║██╔══██╗██╔══██╗██║██╔════╝██║ ██╔╝
 ██║     ██║██████╔╝██████╔╝██║██║     █████╔╝ 
 ██║     ██║██╔══██╗██╔══██╗██║██║     ██╔═██╗ 
 ███████╗██║██████╔╝██║  ██║██║╚██████╗██║  ██╗
 ╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝
----------------------------------------------------------------
 Automated Installer
----------------------------------------------------------------
"
# See: https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/amd64/iso-cd/
# TODO: Store blender config
# TODO: Automate Firefox config
# TODO: Install vscode
# TODO: Configure AppArmor
# TODO: Configure rkhunter

# Set initial environment variables
sh -c ./set-environment.sh
# Disable swap
sudo swapoff -a
# Copy git configs
mkdir -p $HOME/.config/git
cp ./configs/.config/git/* $HOME/.config/git/
# Install common tools
sudo apt-get update
sudo rm -rf /etc/zsh
xargs sudo apt-get install -y < ./pkg-files/base.txt
sudo apt-get install -y vi vim nano
# Ensure that ufw is installed and enabled
sudo apt-get install -y ufw
sudo systemctl enable ufw
# Set up networking
sudo apt-get install -y network-manager
sudo systemctl enable --now NetworkManager

# Delegate work to other scripts
sh -c ./initial-setup.sh
sh -c ./install-fonts.sh
sh -c ./install-gnome.sh
sh -c ./install-zsh.sh
sh -c ./install-cargo-and-lsd.sh
sh -c ./install-signal.sh
sh -c ./install-flatpaks.sh
sh -c ./install-packages.sh

# Copy VSCode settings
mkdir -p $HOME/.config/Code/User/
cp ./configs/.config/Code/User/settings.json $HOME/.config/Code/User/
