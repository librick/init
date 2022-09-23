# Install fonts
sudo apt-get install -y curl
rm -rf ~/.local/share/fonts/NerdFonts
mkdir -p ~/.local/share/fonts/NerdFonts
FONT_SRC="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf"
curl -fLo "${HOME}/.local/share/fonts/NerdFonts/Fira Code Regular Nerd Font Complete.ttf" $FONT_SRC
fc-cache -v
