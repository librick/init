#!/usr/bin/env bash
# Install fonts
sudo apt-get install -y curl
rm -rf ~/.local/share/fonts/NerdFonts
mkdir -p ~/.local/share/fonts/NerdFonts
FONT_SRC="https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip"
curl -fLo "${HOME}/.local/share/fonts/NerdFonts/fonts.zip" $FONT_SRC
unzip "${HOME}/.local/share/fonts/NerdFonts/fonts.zip" -d "${HOME}/.local/share/fonts/NerdFonts/
fc-cache -v
