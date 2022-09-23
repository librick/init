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

# Set locale
sudo rm -rf /etc/environment /etc/locale.gen /etc/locale.conf
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf
sudo locale-gen en_US.UTF-8

# Copy git configs
mkdir -p $HOME/.config/git
cp ./configs/.config/git/* $HOME/.config/git/

# Install common tools
sudo apt-get update
xargs sudo apt-get install -y < ./pkg-files/base.txt
# Ensure that ufw is installed and enabled
sudo apt-get install -y ufw
sudo systemctl enable ufw

## Set locale
#sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
#locale-gen
#timedatectl --no-ask-password set-timezone ${TIMEZONE}
#timedatectl --no-ask-password set-ntp 1
#localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"
#ln -s /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
#echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
#echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
#echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf
#sudo locale-gen en_US.UTF-8
# Set keymaps
#localectl --no-ask-password set-keymap ${KEYMAP}

# Install fonts
sudo apt-get install -y curl
mkdir -p ~/.local/share/fonts/NerdFonts
FONT_SRC="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf"
curl -fLo "${HOME}/.local/share/fonts/NerdFonts/Fira Code Regular Nerd Font Complete.ttf" $FONT_SRC
fc-cache -v

# Install ohmyzsh
sudo rm -f /etc/zsh/zshenv
sudo mkdir -p /etc/zsh/
sudo cp ./configs/etc/zsh/zshenv /etc/zsh/
rm -rf $HOME/user/.oh-my-zsh/
rm -f $HOME/.zshrc* $HOME/.zcompdump* $HOME/.zsh_history* .lesshst
source /etc/zsh/zshenv
export ZDOTDIR=$HOME/.config/zsh
export ZSH=$HOME/.config/zsh/oh-my-zsh
rm -rf $HOME/.config/zsh
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh > ohmyzsh-install.sh
chmod +x ohmyzsh-install.sh
./ohmyzsh-install.sh --unattended
rm -f ohmyzsh-install.sh
sudo chsh -s /usr/bin/zsh
rm -r $HOME/.zshrc*
cp -r ./configs/.config/zsh/ $HOME/.config/

# Install Rust's package manager, cargo:
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$CARGO_HOME/env"
# Use cargo to install lsd
cargo install lsd

# Set up networking
sudo apt-get install -y network-manager dhclient
sudo systemctl enable --now NetworkManager

# Install Gnome
xargs sudo apt-get install -y < ./pkg-files/gnome.txt
sudo systemctl enable gdm
sudo systemctl set-default graphical.target

# Install Signal via trusted repository
sudo rm -f /etc/apt/sources.list.d/signal*.list
sudo rm -f /usr/share/keyrings/signal-desktop-keyring.gpg
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
