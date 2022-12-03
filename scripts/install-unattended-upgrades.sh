#!/usr/bin/env bash
# Install unattended-upgrades package to keep apt software up-to-date
sudo apt-get -y update && sudo apt-get install -y unattended-upgrades
sudo systemctl enable --now unattended-upgrades
sudo systemctl status unattended-upgrades

