#!/bin/bash

GITHUB_ZSH_URL=https://raw.githubusercontent.com/gastonprieto/ubuntu-bootstrap/main/resources/.zshrc

# Zsh
sudo apt-get install -y zsh autojump && \
chsh -s /usr/bin/zsh && \
mkdir -p $APPS/antigen && \
curl -L git.io/antigen > $APPS/antigen/antigen.zsh && \
wget -q $GITHUB_ZSH_URL -O $ZSH_FILE && \
echo "" >> $ZSH_FILE

# fzf
sudo apt install fzf

# starship
curl -sS https://starship.rs/install.sh | sh

echo "# Starship" >> $ZSH_FILE
echo "" >> $ZSH_FILE
echo "eval "$(starship init zsh)"" >> $ZSH_FILE
echo "" >> $ZSH_FILE