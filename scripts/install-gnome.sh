#!/usr/bin/env bash
# Install Gnome
xargs sudo apt-get install -y < ./pkg-files/gnome.txt
sudo systemctl set-default graphical.target
sudo apt-get purge -y --autoremove gnome-terminal nautilus-extension-gnome-terminal
sudo apt-get install -y gnome-console nautilus-extension-gnome-console
# Copy profile picture
cp -f ./configs/.face $HOME/.config/.face
# Set default font
gsettings set org.gnome.desktop.interface monospace-font-name "Fira Code 11"
