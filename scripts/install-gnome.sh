#!/usr/bin/env bash
# Install Gnome
xargs sudo apt-get install -y < ./pkg-files/gnome.txt
sudo systemctl set-default graphical.target
sudo apt-get purge -y --autoremove gnome-terminal nautilus-extension-gnome-terminal mpv
sudo apt-get install -y gnome-console nautilus-extension-gnome-console
# Install sound software
sudo apt-get install -y pulseaudio pulseaudio-utils pavucontrol
systemctl --user enable --now pulseaudio
systemctl --user restart --now pulseaudio
# Copy profile picture
cp -f ./configs/.face $HOME/.config/.face
# Set gsettings
sh -c ./scripts/set-gsettings.sh
