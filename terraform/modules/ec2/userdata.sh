#!/bin/bash
set -eux

# Update packages
apt-get update

# Install Docker
apt-get install -y docker.io

systemctl enable docker
systemctl start docker

# Allow ubuntu user to use docker
usermod -aG docker ubuntu

# Install dependencies
apt-get install -y curl unzip

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

./aws/install

# Install Docker Compose Plugin
mkdir -p /usr/local/lib/docker/cli-plugins

curl -SL \
https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
-o /usr/local/lib/docker/cli-plugins/docker-compose

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Application directory
mkdir -p /home/ubuntu/student-app

chown -R ubuntu:ubuntu /home/ubuntu/student-app

# Verification
docker --version
docker compose version
aws --version