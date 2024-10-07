#!/usr/bin/env bash
# If we don't use SSH, host pc requires python3, ansible and git to be installed
# at the very minimum. This script will install the necessary dependencies.

echo "Choose your operating system:"
echo "1. Darwin"
echo "2. Ubuntu"
echo "3. RedHat"

read -p "Enter the number corresponding to your operating system: " result

setup_darwin() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install python3 ansible git
}

setup_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y python3 ansible git
  ansible-playbook bootstrap.yml --ask-become-pass -vv
}

setup_redhat() {
  sudo yum update
  sudo yum install -y python3 ansible git
  ansible-playbook bootstrap.yml --ask-become-pass -vv
}

if [ "$result" = "1" ]; then
  setup_darwin
elif [ "$result" = "2" ]; then
  setup_ubuntu
elif [ "$result" = "3" ]; then
  setup_redhat
else
  echo "Invalid input. Please choose a valid option."
fi

