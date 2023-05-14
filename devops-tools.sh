#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root"
    exit 1
fi

function install_git {
    echo "Installing Git..."
    apt-get -qq update && apt-get install -qqy git
    if [ "$?" != "0" ]; then
        echo "Error installing Git"
        exit 1
    fi  
        echo "Git installed successfully!"
}

function install_docker {
    echo "Installing Docker..."
    apt-get -qq update && apt-get install -qqy docker.io && apt-get install -qq docker-compose
    if [ "$?" != "0" ]; then
        echo "Error installing Docker"
        exit 1
    fi
    usermod -aG docker $USER
    echo "Docker installed successfully!"
}

function install_ansible {
    echo "Installing Ansible..."
    apt-get -qq update && apt-get install -yqq ansible
    if [ "$?" != "0" ]; then
        echo "Error installing Ansible"
        exit 1
    fi
    echo "Ansible installed successfully!"
}

function install_jenkins {
    echo "Installing Jenkins..."
    curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    if ! sudo apt-get -qq update; then
        echo "Error updating package index. Aborting installation."
        return 1
    fi
    if ! sudo apt-get install -yqq fontconfig openjdk-11-jre; then
        echo "Error installing required packages. Aborting installation."
        return 1
    fi
    if ! sudo apt-get install -yqq jenkins; then
        echo "Error installing Jenkins. Aborting installation."
        return 1
    fi
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
    "install-git")
    install_git
    ;;
    "install-docker")
    install_docker
    ;;
    "install-ansible")
    install_ansible
    ;;
    "install-jenkins")
    install_jenkins
    ;;  
    "install-all")
    install_all
    ;;
    *)
    help
    ;;
esac