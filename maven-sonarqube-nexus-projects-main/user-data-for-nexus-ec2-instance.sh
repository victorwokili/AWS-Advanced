#!/bin/bash

# Update the system and install OpenJDK 1.8
yum update -y
yum install -y java-1.8.0-openjdk

# Create a nexus user with full permission
useradd nexus
echo "nexus ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

# Download the latest Nexus package
cd /opt
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -xvf latest-unix.tar.gz

# Find the extracted directory name
NEXUS_DIR=$(tar -tf latest-unix.tar.gz | head -1 | cut -d"/" -f1)

# Rename the Nexus directory to a consistent name
mv $NEXUS_DIR nexus

# Give the nexus user ownership of the Nexus directory
chown -R nexus:nexus /opt/nexus

# Modify the Nexus configuration to run as the nexus user
echo 'run_as_user="nexus"' | tee /opt/nexus/bin/nexus.rc

# Create a symbolic link for Nexus
ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

# Switch to the nexus user and start Nexus
su - nexus -c "/etc/init.d/nexus start"

# Enable Nexus to start on boot
chkconfig --add nexus
chkconfig nexus on

# Retrieve the public IP of the EC2 instance
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

# Provide the Nexus URL for access
echo "Nexus is running. Access it at: http://$PUBLIC_IP:8081"

