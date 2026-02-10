#!/bin/bash
# Server initialization script

set -e

echo "Initializing server..."

# Update system
apt-get update && apt-get upgrade -y

# Install Docker
curl -fsSL https://get.docker.com | sh
systemctl enable docker
systemctl start docker

# Install Docker Compose
apt-get install -y docker-compose-plugin

# Install Nginx
apt-get install -y nginx

# Configure firewall
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
echo "y" | ufw enable

# Create deploy user
useradd -m -s /bin/bash deployer
usermod -aG docker deployer

echo "✅ Server initialization complete!"
