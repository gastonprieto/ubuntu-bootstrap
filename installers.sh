#!/bin/bash

set -e

export APPS=$HOME/apps
export ZSH_FILE=$HOME/.zshrc

mkdir -p $APPS

sudo apt update && sudo apt upgrade -y

sudo apt-get install -y snapd && \
sudo apt-get install -y curl wget git
