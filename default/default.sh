#!/bin/bash

APPS_TO_INSTALL='terminator filezilla tree ttf-mscorefonts-installer'

# Apps
echo "Installing ($APPS_TO_INSTALL)..."


sudo apt-get install -y $APPS_TO_INSTALL && \
sudo fc-cache -f -v && \
snap install slack --classic 

echo "Installed ($APPS_TO_INSTALL)..."