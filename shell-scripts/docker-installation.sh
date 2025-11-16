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

# mkdir -p ~/.docker/cli-plugins/

# curl -sSL https://github.com/docker/buildx/releases/download/v0.17.1/buildx-v0.17.1.linux-amd64 \
#   -o ~/.docker/cli-plugins/docker-buildx

# chmod +x ~/.docker/cli-plugins/docker-buildx

# # Install Trivy
# curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh

# # Clone repo (clean first)
# rm -rf /home/ec2-user/scripts
# git clone https://github.com/konka-devops-lab/scripts.git /home/ec2-user/scripts
# chown -R ec2-user:ec2-user /home/ec2-user/scripts

# rm -rf /home/ec2-user/get_helm.sh



# # - --kubelet-insecure-tls

#!/bin/bash
set -e

# Install packages
dnf install -y git docker tmux tree

# Start docker service
systemctl enable --now docker

# Add ec2-user to docker group
usermod -aG docker ec2-user

# --------------------------
# Install Docker Compose
# --------------------------
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose


# --------------------------
# Install Docker Buildx (GLOBAL - FIXED)
# --------------------------
mkdir -p /usr/libexec/docker/cli-plugins/

curl -sSL \
  https://github.com/docker/buildx/releases/download/v0.17.1/buildx-v0.17.1.linux-amd64 \
  -o /usr/libexec/docker/cli-plugins/docker-buildx

chmod +x /usr/libexec/docker/cli-plugins/docker-buildx


# --------------------------
# Install Trivy
# --------------------------
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh


# --------------------------
# Clone Repository
# --------------------------
rm -rf /home/ec2-user/scripts

git clone https://github.com/konka-devops-lab/scripts.git /home/ec2-user/scripts

chown -R ec2-user:ec2-user /home/ec2-user/scripts


# --------------------------
# Cleanup (optional)
# --------------------------
rm -rf /home/ec2-user/get_helm.sh
