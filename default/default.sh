#!/bin/bash

APPS_TO_INSTALL='terminator filezilla tree ttf-mscorefonts-installer'

# Apps
sudo apt-get install -y $APPS_TO_INSTALL && \
sudo fc-cache -f -v && \
snap install slack --classic 
