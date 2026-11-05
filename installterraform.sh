#!/usr/bin/env bash

set -euo pipefail

echo "========================================="
echo " Installing Terraform on Ubuntu / WSL"
echo "========================================="

echo
echo "[1/6] Updating package index..."
sudo apt-get update

echo
echo "[2/6] Installing required packages..."
sudo apt-get install -y \
  curl \
  wget \
  gnupg \
  software-properties-common \
  lsb-release

echo
echo "[3/6] Installing HashiCorp GPG key..."
wget -O - https://apt.releases.hashicorp.com/gpg \
  | sudo gpg --dearmor \
  -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo
echo "[4/6] Adding HashiCorp APT repository..."

UBUNTU_CODENAME="$(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || true)"

if [ -z "${UBUNTU_CODENAME}" ]; then
  UBUNTU_CODENAME="$(lsb_release -cs)"
fi

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com ${UBUNTU_CODENAME} main" \
  | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null

echo
echo "[5/6] Installing Terraform..."
sudo apt-get update
sudo apt-get install -y terraform

echo
echo "[6/6] Verifying Terraform installation..."

terraform version

echo
echo "========================================="
echo " Terraform installation completed."
echo "========================================="

