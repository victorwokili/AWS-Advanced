#!/bin/bash

# Update the system and install OpenJDK 17
sudo yum update -y
sudo yum install -y java-17-amazon-corretto-headless

# Download the latest Nexus package
cd /opt
sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz

# Extract the downloaded Nexus archive
sudo tar -xvzf latest-unix.tar.gz

# Determine the extracted Nexus directory name
NEXUS_DIR=$(tar -tf latest-unix.tar.gz | head -1 | cut -d"/" -f1)

# Rename the extracted folder for easier access
sudo mv $NEXUS_DIR nexus

# Go to the Nexus installation directory and start Nexus
cd /opt/nexus/bin
sudo ./nexus start

# Add Nexus to chkconfig to manage service startup
sudo chkconfig --add nexus
sudo chkconfig nexus on
