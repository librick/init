#!/usr/bin/env bash
# Install Go
# Get the most recent version number, e.g., "go1.9.7" (w/o quotes).
REPO=https://github.com/golang/go.git
GO_VERSION=$(curl https://go.dev/VERSION?m=text)
# Download the most recent source
rm -rf /usr/local/go
echo "Downloading binaries for Go version ${GO_VERSION}"
curl -SL "https://dl.google.com/go/${GO_VERSION}.linux-amd64.tar.gz" | tar -xzC /usr/local/
echo "Running 'go version'"
/usr/local/go/bin/go version
/usr/local/go/bin/go install golang.org/x/tools/gopls@latest
/usr/local/go/bin/go install github.com/go-delve/delve/cmd/dlv@latest
