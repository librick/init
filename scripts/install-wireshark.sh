#!/bin/usr/env bash
sudo apt-get -y update
sudo apt-get -y install wireshark-common wireshark wireshark-qt
sudo dpkg-reconfigure wireshark-common
sudo adduser $USER wireshark
sudo chmod +x /usr/bin/dumpcap

