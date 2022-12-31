#!/usr/bin/env bash
# Uninstall keybase
# Users may have to manually check /apt/sources/list.d or similar to see if an apt repo was added

# stop and delete the "keybase" systemd service
sudo systemctl stop keybase
sudo systemctl disable keybase
systemctl --user stop keybase
systemctl --user disable keybase
rm /etc/systemd/system/keybase
rm /etc/systemd/system/keybase # and symlinks that might be related
rm /usr/lib/systemd/system/keybase
rm /usr/lib/systemd/system/keybase # and symlinks that might be related
# stop and delete the "kbfs" systemd service
sudo systemctl stop kbfs
sudo systemctl disable kbfs
systemctl --user stop kbfs
systemctl --user disable kbfs
rm /etc/systemd/system/kbfs
rm /etc/systemd/system/kbfs # and symlinks that might be related
rm /usr/lib/systemd/system/kbfs
rm /usr/lib/systemd/system/kbfs # and symlinks that might be related
# reset the state of all systemd units
sudo systemctl daemon-reload
sudo systemctl reset-failed
systemctl --user daemon-reload
systemctl --user reset-failed
# attempt to uninstall the apt package if it exists
sudo apt-get -y update
sudo apt-get purge -y --autoremove keybase

