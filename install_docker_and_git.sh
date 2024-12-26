#!/bin/bash

# Exit on error
set -e

echo "Starting Docker and Git installation script..."

# Update system
echo "Updating system packages..."
sudo dnf upgrade -y

# Install Docker
echo "Installing Docker..."
sudo dnf install -y docker
sudo systemctl start docker
sudo systemctl enable docker

# Create docker group and add user
echo "Setting up Docker permissions..."
if ! getent group docker > /dev/null 2>&1; then
    echo "Creating docker group..."
    sudo groupadd docker
fi

echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker installations
echo "Verifying Docker installations..."
docker --version
docker-compose --version

# Install Git
echo "Installing Git..."
sudo dnf install -y git

# Setup SSH directory and config
echo "Setting up SSH configuration..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh

# Create SSH config file
cat > ~/.ssh/config << EOL
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa
    IdentitiesOnly yes
    PreferredAuthentications publickey
    AddKeysToAgent yes
EOL

# Set proper permissions for SSH files
chmod 600 ~/.ssh/config

# Configure Git
echo "Configuring Git..."
git config --global user.name "AI Gil"
git config --global user.email "gmc.luu@gmail.com"

# Final Docker setup
echo "Finalizing Docker setup..."
sudo usermod -aG docker ec2-user
sudo systemctl restart docker

echo "Installation complete!"
echo "NOTE: You may need to log out and back in for Docker group changes to take effect."
echo "NOTE: Don't forget to add your SSH keys (id_rsa and id_rsa.pub) to ~/.ssh/" 


echo "Remember to run: chmod 600 ~/.ssh/id_rsa && chmod 644 ~/.ssh/id_rsa.pub"
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub