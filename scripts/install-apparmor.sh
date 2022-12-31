#!/usr/bin/env bash
sudo apt-get -y update
sudo apt-get -y autoremove
sudo apt-get -y install apparmor apparmor-utils apparmor-profiles apparmor-profiles-extra
sudo systemctl enable --now apparmor.service
sudo aa-enforce /etc/apparmor.d/usr.sbin.avahi-daemon
sudo aa-enforce /etc/apparmor.d/usr.sbin.traceroute
sudo aa-enforce /etc/apparmor.d/usr.lib.libreoffice.program.oosplash
sudo aa-enforce /etc/apparmor.d/usr.lib.libreoffice.program.soffice.bin
sudo aa-enforce /etc/apparmor.d/bin.ping
sudo aa-enforce /etc/apparmor.d/lsb_release
