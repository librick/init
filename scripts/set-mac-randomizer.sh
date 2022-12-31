#!/usr/bin/env bash
# Randomize MAC address via NetworkManager
# See: https://fedoramagazine.org/randomize-mac-address-nm/
# See: https://wiki.archlinux.org/title/MAC_address_spoofing
# See: https://wiki.archlinux.org/title/NetworkManager#Configuring_MAC_address_randomization
# Copy NetworkManager configs
sudo mkdir -p /etc/NetworkManager/conf.d
sudo cp ./configs/etc/NetworkManager/conf.d/00-macrandomize.conf /etc/NetworkManager/conf.d/
sudo systemctl restart NetworkManager

