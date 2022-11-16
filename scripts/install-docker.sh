# Install Docker Engine
# See: https://docs.docker.com/engine/install/

# Remove debian sources list if it exists
sudo rm -rf /etc/apt/sources.list.d/docker.list
# Update apt
sudo apt-get update -y
# Ensure that apt can use repos over HTTPS
sudo apt-get install -y ca-certificates curl gnupg lsb-release
# Ensure that apt keyrings directory exists
sudo mkdir -p /etc/apt/keyrings
# Download and import the docker gpg key
sudo rm -rf /etc/apt/keyrings/docker.gpg
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Add docker repo
# Docker doesn't currently have a bookworm (testing) repo, so use bullseye (stable)
releaseName=bullseye
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $releaseName stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Make sure docker gpg file has correct permissions
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# Update apt again
sudo apt-get update -y

# Uninstall any old docker versions
sudo apt-get remove -y --purge docker docker-engine docker.io containerd runc
# Install the latest docker version
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Ensure that the kvm kernel module is loaded
modprobe kvm
# Load architecture-specific kernel module, ignoring errors
modprobe kvm_intel 2> /dev/null
modprobe kvm_amd 2> /dev/null
# Add the current user to the kvm group
sudo usermod -aG kvm ${USER}
# Add the current user to the docker group
sudo usermod -aG docker ${USER}

# Run docker hello world image
sudo docker run hello-world

