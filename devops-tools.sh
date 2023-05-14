#!/bin/bash

function install_git {
    echo "Installing Git..."
    apt-get update && apt-get install -y git
    echo "Git installed successfully!"
}

function install_docker {
    echo "Installing Docker..."
    apt-get update && apt-get install -y docker.io && apt-get install compose
    usermod -aG docker $USER
    echo "Docker installed successfully!"
}

function install_ansible {
    echo "Installing Ansible..."
    apt-get update && apt-get install -y ansible
    echo "Ansible installed successfully!"
}

function install_jenkins {
    echo "Installing Jenkins..."
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
    echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
    apt-get update && apt-get install -y jenkins
    echo "Jenkins installed successfully!"
}

function install_all {
    install_git
    install_docker
    install_ansible
    install_jenkins
}

function help {
    echo "Options:"
    echo "install git"
    echo "install docker"
    echo "install ansible"
    echo "install jenkins"
    echo "install all"
}

case $1 in
    "install git")
    install_git
    ;;
    "install docker")
    install_docker
    ;;
    "install ansible")
    install_ansible
    ;;
    "install jenkins")
    install_jenkins
    ;;
    "install all")
    install_all
    ;;
    *)
    help
    ;;
esac