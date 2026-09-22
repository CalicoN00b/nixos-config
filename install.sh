#!/usr/bin/env bash

if [[ $EUID -eq 0 ]]; then
    echo "Do not run this script as root! Exiting"
    exit 1
fi

echo "Welcome to the install script for CalicoN00b's NixOS Config!"
echo "This script will ask you to confirm you username, hostname and a couple miscellaneous configs, and then will install the entire config in one go."
echo

# Get username
read -p "Is $(whoami) the correct username? [y/N] " uConf
if ! [[ $uConf =~  ^[YyNn]{0,1}$ ]]; then
    echo "Invalid answer! Aborting"
    exit 1
fi

if [[ $uConf =~ ^[Nn]{0,1}$ ]]; then
    read -p "Please enter your username: " username

    if ! [[ $username =~ ^[a-z][a-z0-9_-]{0,31}$ ]]; then
        echo "Username is invalid! Aborting"
        exit 1
    fi

    echo
else
    username="$(whoami)"
fi

# Get hostname
read -p "Is $(hostname) the correct hostname? [y/N] " hConf
if ! [[ $hConf =~ ^[YyNn]{0,1}$ ]]; then
    echo "Invalid answer! Aborting"
    exit 1
fi

if [[ $hConf =~ ^[Nn]{0,1}$ ]]; then
    read -p "Please enter your hostname: " hostname
    echo
else
    hostname="$(hostname)"
fi

# Git configuration
read -p "Would you like you configure git user name and user email? [y/N] " gConf
if ! [[ $gConf =~ ^[YyNn]{0,1}$ ]]; then
    echo "Invalid answer! Aborting"
    exit 1
fi

if [[ $gConf =~ ^[Nn]{0,1}$ ]]; then
    echo "No worries! Please configure ./home/git.nix later!"
else
    read -p "Please enter git user name: " gUserName
    read -p "Please enter git user email: " gUserEmail
fi

clear

# Recap of user choices
echo "SUMMARY"
echo "============================="
echo "Username: $username"
echo "Hostname: $hostname"

if [[ $gConf =~ ^[Yy]{1,1}$ ]]; then
    echo "Git User Name: $gUserName"
    echo "Git User Email: $gUserEmail"
fi

echo "============================="
echo "Please make sure these values are correct before proceeding."
echo "This is your final chance to back out of this installation."
read -p "You are about to build the system with this config. Proceed? [y/N] " fConf

if ! [[ $fConf =~ ^[YyNn]{0,1}$ ]]; then
    echo "Invalid answer! Aborting"
    exit 1
fi

if [[ $fConf =~ ^[Nn]{0,1}$ ]]; then
    echo "Installation cancelled! Exiting"
    exit 0
fi

echo "Updating username"
sed -i "s/MY_USERNAME/$username/g" ./flake.nix

echo "Updating hostname"
sed -i "s/MY_HOSTNAME/$hostname/g" ./flake.nix

if [[ $gConf =~ ^[Yy]{1,1}$ ]]; then
    echo "Updating git.nix config"
    sed -i "s/MY_NAME/$gUserName/g" ./home/git.nix
    sed -i "s/MY_EMAIL/$gUserEmail/g" ./home/git.nix
fi

if [ ! -f /etc/nixos/hardware-configuration.nix ]; then
    echo "/etc/nixos/hardware-configuration.nix does not exist! Regenerating hardware config (will ask for sudo password)."
    sudo nixos-generate-config --show-hardware-config > ./system/hardware-configuration.nix
else 
    echo "Copying /etc/nixos/hardware-configuration.nix to ./system/hardware-configuration.nix"
    cp /etc/nixos/hardware-configuration.nix ./system/hardware-configuration.nix
fi

echo "Rebuilding system (will ask for sudo password)"
sudo nixos-rebuild switch --flake .#$hostname
if [ $? -ne 0 ]; then
    echo "Failed to build system!"
    echo "Reverting username"
    sed -i "s/$username/MY_USERNAME/g" ./flake.nix

    echo "Reverting hostname"
    sed -i "s/$hostname/MY_HOSTNAME/g" ./flake.nix

    if [[ $gConf =~ ^[Yy]{1,1}$ ]]; then
        echo "Reverting git.nix config"
        sed -i "s/$gUserName/MY_NAME/g" ./home/git.nix
        sed -i "s/$gUserEmail/MY_EMAIL/g" ./home/git.nix
    fi

    echo "Please read the nixos-rebuild error messages to try to fix it, then rerun this script"
    exit 1
fi

echo "System built successfully!"
echo "Please reboot to fully apply the config"