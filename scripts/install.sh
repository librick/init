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
# TODO: Store blender config
# TODO: Automate Firefox config
# TODO: Install vscode
# TODO: Configure AppArmor
# TODO: Configure rkhunter

# Disable swap
sudo swapoff -a

# Preemptively force misbehaving apps to follow XDG settings
# See: https://wiki.archlinux.org/title/XDG_Base_Directory#Support.
export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export IPFS_PATH="$XDG_DATA_HOME"/ipfs
export ZDOTDIR=$HOME/.config/zsh
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export LESSHISTFILE=-

# Copy git configs
cp ./configs/.config/git/* $HOME/.config/git/

# Install common tools
sudo apt-get update
sudo apt-get install xargs
xargs sudo apt-get install -y < ./pkg-files/base.txt
# Ensure that ufw is installed and enabled
sudo apt-get install -y ufw
sudo systemctl enable ufw

# Set locale
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
timedatectl --no-ask-password set-timezone ${TIMEZONE}
timedatectl --no-ask-password set-ntp 1
localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"
ln -s /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf
sudo locale-gen en_US.UTF-8

# Set keymaps
localectl --no-ask-password set-keymap ${KEYMAP}

# Install fonts
mkdir -p ~/.local/share/fonts/NerdFonts
FONT_SRC="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf"
cd ~/.local/share/fonts/NerdFonts && curl -fLo "Fira Code Regular Nerd Font Complete.ttf" ${FONT_SRC}
fc-cache -v

# Install ohmyzsh
export ZDOTDIR=$HOME/.config/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Copy ZSH configs
cp ./configs/.config/zsh/* $HOME/.config/zsh/

# Install Rust's package manager, cargo:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Use cargo to install lsd
cargo install lsd

# Set up networking
sudo apt-get install -y networkmanager dhclient
sudo systemctl enable --now NetworkManager

# Install Gnome
xargs sudo apt-get install -y < ./pkg-files/gnome.txt
sudo systemctl enable gdm
sudo systemctl set-default graphical.target

# Install Signal via trusted repository
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt-get update && sudo apt-get install -y signal-desktop

# Install Brave, Discord, and Telegram via Flatpak
sudo apt-get install -y flatpak
flatpak install flathub com.brave.Browser
flatpak install flathub com.discordapp.Discord
flatpak install flathub.com org.telegram.desktop

# Copy VSCode settings
cp ./configs/.config/Code/User/settings.json $HOME/.config/Code/User/

# Install QEMU
#sudo apt-get install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
#sudo systemctl enable --now libvirtd
#sudo systemctl start libvirtd
#sudo virsh net-start default
#sudo virsh net-autostart default
#sudo virsh net-list --all
#sudo adduser $USER libvirt
#sudo adduser $USER libvirt-qemu
