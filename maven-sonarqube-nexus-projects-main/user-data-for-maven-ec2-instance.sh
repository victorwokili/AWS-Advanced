#!/bin/bash

# Update the system and install OpenJDK 11
sudo yum update -y
sudo amazon-linux-extras install java-openjdk11 -y

# Verify Java installation
java --version

# Download and install Apache Maven
sudo wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven

# Configure MAVEN_HOME and PATH Environment Variables
sudo rm /home/ec2-user/.bash_profile
sudo wget https://raw.githubusercontent.com/victorwokili/AWS-Advanced/main/maven-sonarqube-nexus-projects-main/jenkins-master-client-config/.bash_profile -O /home/ec2-user/.bash_profile
sudo chown ec2-user:ec2-user /home/ec2-user/.bash_profile

# Apply the environment variables
source /home/ec2-user/.bash_profile

# Verify Maven installation
mvn -v

# Install Git SCM
sudo yum install git -y

# Switch to ec2-user and clone the Git repository
sudo -u ec2-user git clone https://github.com/victorwokili/AWS-Advanced.git /home/ec2-user/AWS-Advanced

# Move the specific folder to the home directory
sudo mv /home/ec2-user/AWS-Advanced/maven-sonarqube-nexus-projects-main /home/ec2-user/

# Delete the rest of the AWS-Advanced repository to declutter
sudo rm -rf /home/ec2-user/AWS-Advanced

# Ensure the correct ownership of the moved directory
sudo chown -R ec2-user:ec2-user /home/ec2-user/maven-sonarqube-nexus-projects-main

# Ensure the script runs with a new shell session
exec bash
