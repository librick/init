#!/usr/bin/env bash
# Install tools for managing Yubikeys
# The yubikey CLI is called "ykman"
sudo apt-get update -y
sudo apt-get install -y yubikey-agent yubikey-manager yubikey-manager-qt yubikey-personalization

