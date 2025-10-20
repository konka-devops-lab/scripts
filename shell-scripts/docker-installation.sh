#!/bin/bash
set -e

# Install packages
dnf install -y git docker tmux tree

# Start docker
systemctl enable --now docker
usermod -aG docker ec2-user

# Docker compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Trivy
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh

# Clone repo (clean first)
rm -rf /home/ec2-user/scripts
git clone https://github.com/konka-devops-lab/scripts.git /home/ec2-user/scripts
chown -R ec2-user:ec2-user /home/ec2-user/scripts

rm -rf /home/ec2-user/get_helm.sh

git clone https://github.com/konka-devops-lab/k8s-administration.git /home/ec2-user/k8s-administration
chown -R ec2-user:ec2-user /home/ec2-user/k8s-administration


# - --kubelet-insecure-tls