# Install Gnome
xargs sudo apt-get install -y < ./pkg-files/gnome.txt
sudo systemctl set-default graphical.target
