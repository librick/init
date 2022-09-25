#!/usr/bin/env bash
# Install fonts
sudo apt-get autoremove
sudo apt-get update
sudo apt-get install -y curl unzip fonts-noto-color-emoji
mkdir -p $HOME/.config/fontconfig/conf.d
\cp ./configs/.config/fontconfig/conf.d/01-emoji.conf $HOME/.config/fontconfig/conf.d/
rm -rf $HOME/.local/share/fonts/NerdFonts
mkdir -p $HOME/.local/share/fonts/NerdFonts
BASE_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2"
curl -fLo "${HOME}/.local/share/fonts/NerdFonts/Hack.zip" "${BASE_URL}/Hack.zip"
curl -fLo "${HOME}/.local/share/fonts/NerdFonts/FiraCode.zip" "${BASE_URL}/FiraCode.zip"
curl -fLo "${HOME}/.local/share/fonts/NerdFonts/Noto.zip" "${BASE_URL}/Noto.zip"
unzip -o "${HOME}/.local/share/fonts/NerdFonts/Hack.zip" -d "${HOME}/.local/share/fonts/NerdFonts/"
unzip -o "${HOME}/.local/share/fonts/NerdFonts/FiraCode.zip" -d "${HOME}/.local/share/fonts/NerdFonts/"
unzip -o "${HOME}/.local/share/fonts/NerdFonts/Noto.zip" -d "${HOME}/.local/share/fonts/NerdFonts/"
rm -f "${HOME}/.local/share/fonts/NerdFonts/Hack.zip"
rm -f "${HOME}/.local/share/fonts/NerdFonts/FiraCode.zip"
rm -f "${HOME}/.local/share/fonts/NerdFonts/Noto.zip"
fc-cache -v
gsettings set org.gnome.desktop.interface monospace-font-name "Hack Nerd Font Mono Regular 11"

