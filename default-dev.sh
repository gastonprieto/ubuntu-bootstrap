#!/bin/bash

# Development
sudo apt-get install -y neovim && \
sudo apt-get install -y meld && \
snap install sublime-text --classic && \
snap install code --classic

echo '#' >> $ZSH_FILE && \
echo '# Neovim' >> $ZSH_FILE && \
echo '#' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE && \
echo 'alias vim=nvim' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE