#!/bin/bash

# GIT

echo "Installing git..."

sudo apt-get install -y git && \
./git-aliases.sh && \
git config --global core.editor vim && \
git config --global diff.tool meld

echo "Installed git"

# Github CLI

echo "Installing github cli..."

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
sudo apt update && sudo apt install gh && \
gh auth login

echo "Installed github cli"