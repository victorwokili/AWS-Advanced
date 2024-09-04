#!/bin/bash

# Update the system and install OpenJDK 1.8
sudo yum update -y
sudo yum install -y java-1.8.0-openjdk

# Create a nexus user with full permission
sudo useradd nexus
echo "nexus ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

# Download the latest Nexus package
cd /opt
sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz

# Extract the archive
sudo tar -xvzf latest-unix.tar.gz

# Determine the extracted Nexus directory name
NEXUS_DIR=$(tar -tf latest-unix.tar.gz | head -1 | cut -d"/" -f1)

# Rename the directory to a simpler name, e.g., 'nexus'
sudo mv $NEXUS_DIR nexus

# Create the sonatype-work directory
sudo mkdir -p /opt/sonatype-work/nexus3

# Give the nexus user ownership of the Nexus and sonatype-work directories
sudo chown -R nexus:nexus /opt/nexus /opt/sonatype-work

# Switch to the nexus user and start the repository manager in the background
sudo -u nexus /opt/nexus/bin/nexus start

# Enable Nexus to start on boot
sudo chkconfig --add nexus
sudo chkconfig nexus on