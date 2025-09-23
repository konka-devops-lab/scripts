# #!/bin/bash
# set -e

# # Install packages
# dnf install -y git docker tmux tree

# # Start docker
# systemctl enable --now docker
# usermod -aG docker ec2-user

# # Docker compose
# curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose

# # Install Trivy
# curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh

# # Wait for network
# sleep 20

# # Clone repo (clean first)
# rm -rf /home/ec2-user/scripts
# git clone https://github.com/konka-devops-lab/scripts.git /home/ec2-user/scripts
# chown -R ec2-user:ec2-user /home/ec2-user/scripts

# # Run your kind script
# bash /home/ec2-user/scripts/kind/kind-installation.sh
# kind create cluster --config /home/ec2-user/scripts/kind/kind-cluster.yaml
# rm -rf /home/ec2-user/get_helm.sh

# rm -rf /home/ec2-user/k8s-administration

# git clone https://github.com/konka-devops-lab/k8s-administration.git /home/ec2-user/k8s-administration
# chown -R ec2-user:ec2-user /home/ec2-user/k8s-administration


# # - --kubelet-insecure-tls


#!/bin/bash
set -e

# -----------------------------
# 1️⃣ Root-level commands
# -----------------------------

# Install required packages
sudo dnf install -y git docker tmux tree

# Enable and start Docker service
sudo systemctl enable --now docker

# Add ec2-user to docker group so it can run Docker without sudo
sudo usermod -aG docker ec2-user

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
     -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Trivy
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh

# Wait a bit for network to be ready
sleep 20

# -----------------------------
# 2️⃣ ec2-user commands
# -----------------------------

# Switch to ec2-user
sudo -i -u ec2-user bash <<'EOF'

# Clone scripts repo (remove old first)

git clone https://github.com/konka-devops-lab/scripts.git /home/ec2-user/scripts
chown -R ec2-user:ec2-user /home/ec2-user/scripts

# Run kind installation
bash /home/ec2-user/scripts/kind/kind-installation.sh

# Create kind cluster
kind create cluster --config /home/ec2-user/scripts/kind/kind-cluster.yaml

# Remove any leftover files
rm -rf /home/ec2-user/get_helm.sh

# Clone k8s-administration repo
git clone https://github.com/konka-devops-lab/k8s-administration.git /home/ec2-user/k8s-administration

EOF

echo "✅ EC2 userdata setup complete!"
