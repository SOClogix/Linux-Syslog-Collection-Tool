#!/bin/bash

# ###############################################
# Name:         setup-syslog-collect.sh
# Version:      0.0.0
# Author:       SOClogix, Inc.
# Date:         01/10/2024
# Platforms:    Linux (Debian)
# ###############################################

# Install syslog if it does not exist
if command -v rsyslogd &> /dev/null
then
    echo "rsyslog is already installed."
else
    # If not installed, attempt to install it
    echo "rsyslog is not installed. Installing..."
    sudo apt install -y rsyslog
fi

# Configure Sending Syslog to server
# Prompt the user for an IP address
read -p "Enter the IP address for rsyslog configuration: " ip_address

# Update /etc/rsyslog.d/50-default.conf with the provided IP
sudo sed -i "4i*.* @$ip_address:514" /etc/rsyslog.d/50-default.conf

# Restart rsyslog service for changes to take effect
sudo service rsyslog restart

echo "rsyslog configuration updated successfully."

# Send a test log message
logger 'test from client'