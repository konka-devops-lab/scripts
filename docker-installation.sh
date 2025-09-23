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

# Wait for network
sleep 20

# Clone repo (clean first)
rm -rf /home/ec2-user/scripts
git clone https://github.com/konka-devops-lab/scripts.git /home/ec2-user/scripts
chown -R ec2-user:ec2-user /home/ec2-user/scripts

# Run your kind script
bash /home/ec2-user/scripts/kind/kind-installation.sh
kind create cluster --config /home/ec2-user/scripts/kind/kind-cluster.yaml
rm -rf /home/ec2-user/get_helm.sh

rm -rf /home/ec2-user/k8s-administration

git clone https://github.com/konka-devops-lab/k8s-administration.git /home/ec2-user/k8s-administration
chown -R ec2-user:ec2-user /home/ec2-user/k8s-administration


# - --kubelet-insecure-tls



# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# chmod +x kubectl
# mv kubectl /usr/local/bin

# sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
# sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
# sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# sudo yum install java-21-amazon-corretto-devel

# cd /opt

# wget https://archive.apache.org/dist/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz

# mkdir -p maven

# tar -xvzf apache-maven-3.9.8-bin.tar.gz -C maven

# echo 'export PATH=/opt/maven/bin:"$PATH"' >> /home/ec2-user/.bash_profile

# source /home/ec2-user/.bash_profile


# minikube start --network-plugin=cni --cni=calico
