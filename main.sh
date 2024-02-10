#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Update package lists and install necessary packages
apt update
apt install -y tinc

# Initialize Tinc configuration directory
mkdir -p /etc/tinc

# Replace "yourvpnname" with your desired VPN name
VPN_NAME="yourvpnname"

# Initialize Tinc VPN configuration
tincd -n $VPN_NAME -K4096

# Start Tinc VPN daemon
tincd -n $VPN_NAME

echo "Tinc VPN has been installed and started. Don't forget to configure your VPN network!"
