#!/usr/bin/env bash
# Install Go

# Get the most recent version number, e.g., "go1.9.7" (w/o quotes).
REPO=https://github.com/golang/go.git
GO_VERSION=$(curl https://go.dev/VERSION?m=text)
# Download the most recent source
sudo rm -rf /usr/local/go
echo "Downloading binaries for Go version ${GO_VERSION}"
curl -SL "https://dl.google.com/go/${GO_VERSION}.linux-amd64.tar.gz" | sudo tar -xzC /usr/local/
echo "Running 'go version'"
/usr/local/go/bin/go version
# Install dependencies for the Go VSCode extension,
# See: https://github.com/golang/vscode-go/wiki/tools.
# These should not be installed as root,
# as the GOPATH environment variable should be in the user's home directory.
# E.g., GOPATH=/home/$USER/.local/share/go.
/usr/local/go/bin/go install -v golang.org/x/tools/gopls@latest
/usr/local/go/bin/go install -v golang.org/x/tools/cmd/goimports@latest
/usr/local/go/bin/go install -v github.com/go-delve/delve/cmd/dlv@latest
/usr/local/go/bin/go install -v github.com/mdempsky/gocode@latest
/usr/local/go/bin/go install -v github.com/ramya-rao-a/go-outline@latest
/usr/local/go/bin/go install -v honnef.co/go/tools/cmd/staticcheck@latest