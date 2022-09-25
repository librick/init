#!/usr/bin/env bash
# Install Flatpaks
sudo apt-get install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub org.mozilla.firefox
flatpak install -y flathub com.brave.Browser
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub org.telegram.desktop
flatpak install -y flathub org.blender.Blender
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub com.rafaelmardojai.Blanket

