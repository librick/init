#!/usr/bin/env bash
# Install Android platform tools (e.g., ADB)
INSTALL_DIR=$HOME/.local/bin/platform-tools
rm -rf $INSTALL_DIR
mkdir -p $INSTALL_DIR
URL=https://dl.google.com/android/repository/platform-tools-latest-linux.zip
curl -fLo $INSTALL_DIR/platform-tools-latest-linux.zip $URL
unzip $INSTALL_DIR/platform-tools-latest-linux.zip -d $HOME/.local/bin/
