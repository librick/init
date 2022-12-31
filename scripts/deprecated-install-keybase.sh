curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt-get install -y ./keybase_amd64.deb
rm -f ./keybase_amd.deb
# See: https://keybase.pub/7roxel/scripts/keybase_headless_setup.sh
keybase ctl init
systemctl --user enable keybase.service
systemctl --user enable kbfs.service
systemctl --user start keybase.service
systemctl --user start kbfs.service
#su - keybase -c "keybase ctl init"
#su - keybase -c "systemctl --user enable keybase.service"
#su - keybase -c "systemctl --user enable kbfs.service"
