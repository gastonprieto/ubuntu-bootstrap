#!/bin/bash

# Development
echo "Installing dev tools"
sudo apt-get install -y meld && \
snap install sublime-text --classic && \
snap install code --classic

echo "  Installing neovim..."
sudo apt-get install -y neovim && \ 
echo '#' >> $ZSH_FILE && \
echo '# Neovim' >> $ZSH_FILE && \
echo '#' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE && \
echo 'alias vim=nvim' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE
echo "  Installed neovim"

echo "Installed dev tools"