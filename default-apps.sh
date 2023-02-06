#!/bin/bash

# Apps
sudo apt-get install -y terminator && \
sudo apt-get install -y filezilla && \
sudo apt-get install -y simplescreenrecorder && \
sudo apt-get install -y tree && \
sudo apt-get install -y redshift redshift-gtk && \
sudo apt-get install -y ttf-mscorefonts-installer && \
sudo fc-cache -f -v && \
snap install slack --classic 
