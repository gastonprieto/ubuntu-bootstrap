#!/bin/bash

# Zsh
sudo apt-get install -y zsh autojump && \
chsh -s /usr/bin/zsh && \
mkdir -p $APPS/antigen && \
curl -L git.io/antigen > $APPS/antigen/antigen.zsh && \
wget -q https://gist.githubusercontent.com/gastonprieto/9fdf398cf680b1931f994ae853aa3867/raw/1e83ef6a73b3d3d43e3cc74db77f1f4ea51d775d -O $ZSH_FILE && \
echo "" >> $ZSH_FILE
