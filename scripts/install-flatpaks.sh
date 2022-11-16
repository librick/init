#!/usr/bin/env bash
# Install Flatpaks

# Install flatpak binaries
sudo apt-get update -y
sudo apt-get autoremove --purge -y
sudo apt-get install -y flatpak

# Install flatpaks via flatpak CLI
flatpak remote-add -u --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -u -y flathub org.mozilla.firefox
flatpak install -u -y flathub com.brave.Browser
flatpak install -u -y flathub com.discordapp.Discord
flatpak install -u -y flathub org.telegram.desktop
flatpak install -u -y flathub org.blender.Blender
flatpak install -u -y flathub md.obsidian.Obsidian
flatpak install -u -y flathub com.rafaelmardojai.Blanket
flatpak install -u -y com.github.tchx84.Flatseal

# Install update service
systemdUserDir=$XDG_CONFIG_HOME/systemd/user
mkdir -p $systemdUserDir
cp -f ./configs/.config/systemd/user/*.{service,timer} $systemdUserDir/
systemctl --user enable --now update-user-flatpaks.timer

# Attempt to refresh desktop application icons (.desktop files)
xdg-desktop-menu forceupdate
update-desktop-database $USER/.local/share/flatpak/exports/share/applications/

