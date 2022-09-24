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
# TODO: Configure AppArmor
# TODO: Configure rkhunter
# After installing, set up Firefox with https://ffprofile.com.

# Set initial environment variables
sh -c ./set-environment.sh
# Disable swap
sudo swapoff -a
# Set GRUB timeout
BOOT_GRUB_LOCATION=/boot/grub
BOOT_THEME_NAME=framework
git clone https://github.com/AdisonCavani/distro-grub-themes.git
sudo sed -i 's/#?GRUB_TIMEOUT=[0-9]+/GRUB_TIMEOUT=1/g' /etc/default/grub
# Install GRUB theme
sudo sed -i 's/#?GRUB_GFXMODE=.*/GRUB_GFXMODE=1920x1080/g' /etc/default/grub
sudo cp -r "./distro-grub-themes/customize/${BOOT_THEME_NAME}/" "${BOOT_GRUB_LOCATION}/themes"
BOOT_THEME_TXT="${BOOT_GRUB_LOCATION}/themes/${BOOT_THEME_NAME}/theme.txt"
sudo echo GRUB_THEME="$BOOT_THEME_TXT" >> /etc/default/grub
sudo sed -i '/GRUB_THEME=/d' /etc/default/grub
sudo bash -c "echo GRUB_THEME="$BOOT_THEME_TXT" >> /etc/default/grub"
sudo update-grub

# Copy git configs
mkdir -p $HOME/.config/git
cp ./configs/.config/git/* $HOME/.config/git/
# Install common tools
sudo rm -f /etc/apt/sources.list.d/*.list
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo rm -rf /etc/zsh
xargs sudo apt-get install -y < ./pkg-files/base.txt
sudo apt-get install -y vi vim nano
# Ensure that ufw is installed and enabled
sudo apt-get install -y ufw
sudo systemctl enable --now ufw
# Set up networking
sudo apt-get install -y network-manager
sudo systemctl enable --now NetworkManager

# Delegate work to other scripts
sh -c ./initial-setup.sh
sh -c ./install-fonts.sh
sh -c ./install-gnome.sh
sh -c ./install-zsh.sh
sh -c ./install-cargo-and-lsd.sh
sh -c ./install-go.sh
sh -c ./install-adb.sh
sh -c ./install-signal.sh
sh -c ./install-vscode.sh
sh -c ./install-flatpaks.sh
sh -c ./install-packages.sh
echo "Done :)"
