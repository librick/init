#!/bin/bash
echo "Downloading latest release of kubectl";
# Install latest release of kubectl binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl";
echo "Downloading checksum";
# Download a checksum
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256";
echo "Checking checksum";
# Check the checksum; returns nonzero status if this fails
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check;
rm -f kubectl.sha256;
INSTALL_DIR=$HOME/.local/bin/
echo "Installing binaries into $INSTALL_DIR";
# Install for this user only
chmod +x kubectl;
mkdir -p $INSTALL_DIR;
mv ./kubectl ${INSTALL_DIR}kubectl;
echo "Checking kubectl version (it's okay if the HTTP server isn't running)";
# Check the kubectl version
kubectl version --output=yaml

