#!/bin/bash
# This script installs Docker CE on CentOS/RHEL 8

# Ensure System is updated

dnf -y update 

#Add Docker CE Repository
dnf -y install yum-utils curl

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

#Verify repo was added

dnf list docker-ce

#Install the latest version of Docker

dnf install docker-ce --nobest -y

#start and enable docker

systemctl enable --now docker

#Run Docker as a non root user

usermod -aG docker admin

#verify Docker install

docker --version


#Install Docker Compose

curl -L "https://github.com/docker/compose/releases/download/1.27.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make docker compsoe executable
chmod +x /usr/local/bin/docker-compose

#Verify compose install

docker-compose --version
