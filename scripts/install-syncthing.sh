sudo apt-get update && sudo apt-get install -y syncthing
sudo systemctl enable --now syncthing@${USER}.service
