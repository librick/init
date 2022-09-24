#!/usr/bin/env bash
# Install Rust's package manager, cargo:
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
curl https://sh.rustup.rs --proto '=https' --tlsv1.3 -sSf | sh -s -- -y
source "$CARGO_HOME/env"
# Use cargo to install lsd
cargo install lsd
