#!/bin/bash
# Bootstrap script for fresh WSL Ubuntu 24

set -e

echo "🚀 Starting WSL Ubuntu 24 setup..."

# Install Ansible if not present
if ! command -v ansible &> /dev/null; then
    echo "📦 Installing Ansible..."
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
fi

# Run the Ansible playbook
echo "🎭 Running Ansible playbook..."
cd "$(dirname "$0")"
ansible-playbook -i inventory.yml playbook.yml --ask-become-pass

echo "✅ Setup complete! Please restart your terminal or run: exec zsh"