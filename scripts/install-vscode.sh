#!/usr/bin/env bash
# Install VSCode via trusted repository
rm -f /etc/apt/keyrings/packages.microsoft.gpg
rm -f /etc/apt/sources.list.d/vscode.list
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt-get update
sudo apt-get install -y code
# Copy VSCode settings
mkdir -p $HOME/.config/Code/User/
cp -f ./configs/.config/Code/User/settings.json $HOME/.config/Code/User/settings.json