#!/usr/bin/env bash
# Install Go
# Get the most recent version number, e.g., "1.9.7" (w/o quotes).
REPO=https://github.com/golang/go.git
GO_VERSION=$(git ls-remote --sort='version:refname' --tags $REPO '*.*.*' |\
    grep -Po '(?=[a-f,0-9]*\s*)refs\/tags\/go.*' |\
    sed 's/refs\/tags\/go//g' |\
    sort -r |\
    head -n 1)
# Download the most recent source
rm -rf /usr/local/go
echo "Downloading binaries for Go version ${GO_VERSION}"
curl -SL "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz" | tar -xzC /usr/local/
echo "Running 'go version'"
/usr/local/go/bin/go version
