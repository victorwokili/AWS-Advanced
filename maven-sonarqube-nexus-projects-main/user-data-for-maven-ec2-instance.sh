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
rm ~/.bash_profile
wget https://raw.githubusercontent.com/victorwokili/AWS-Advanced/main/maven-sonarqube-nexus-projects-main/jenkins-master-client-config/.bash_profile
source ~/.bash_profile

# Verify Maven installation
mvn -v

# Install Git SCM
sudo yum install git -y

git clone https://github.com/awanmbandi/maven-sonarqube-nexus-project.git 
# Ensure the script runs with a new shell session
exec bash
