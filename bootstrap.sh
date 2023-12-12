#!/bin/zsh

# Define source and destination paths
source_path="/etc/nixos/hardware-configuration.nix"
destination_path="./nixos/hardware-configuration.nix"

# Copy the file from source to destination, overwriting if it exists
cp -f "$source_path" "$destination_path"
echo "Copying 'hardware-configuration.nix' to current flake and overwritten if it exists."

sudo nixos-rebuild switch --flake .

nix-shell '<home-manager>' -A install

home-manager switch --flake .
