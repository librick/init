#!/usr/bin/env bash
# Install Rust's package manager, cargo:
source /etc/zsh/zshenv 
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
curl https://sh.rustup.rs --proto '=https' --tlsv1.3 -sSf | sh -s -- -y
source "$CARGO_HOME/env"
# Install lsd as a pretty ls alternative 
cargo install lsd
# Install simple-http-server for hosting files quickly
sudo apt-get update && sudo apt-get install -y libssl-dev
cargo install simple-http-server


