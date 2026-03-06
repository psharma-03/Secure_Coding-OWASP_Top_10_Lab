#!/usr/bin/env bash
set -euo pipefail

echo "[1/6] Verifying internet connectivity..."
ping -c 3 google.com

echo "[2/6] Updating apt repositories..."
sudo apt update

echo "[3/6] Installing Docker..."
sudo apt install -y docker.io docker-compose-plugin

echo "[4/6] Enabling Docker service..."
sudo systemctl enable docker --now

echo "[5/6] Adding current user to docker group..."
sudo usermod -aG docker "$USER"

echo "[6/6] Installing Burp Suite Community Edition..."
sudo apt install -y burpsuite

echo
echo "Setup complete."
echo "IMPORTANT: Log out and log back in (or reboot) so Docker group changes apply."
echo "Then validate with: docker ps"
