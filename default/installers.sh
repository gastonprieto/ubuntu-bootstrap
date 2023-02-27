#!/bin/bash

set -e

export APPS=$HOME/apps
export ZSH_FILE=$HOME/.zshrc

mkdir -p $APPS

echo "Upgrading apt..."
sudo apt update && sudo apt upgrade -y

echo "Installing snap..."
sudo apt-get install -y snapd && \

echo "Installing http clients..."
sudo apt-get install -y curl wget

echo "Installing git..."
sudo apt-get install -y git
echo "Installed git"
