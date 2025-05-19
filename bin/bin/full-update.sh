#! /usr/bin/bash

sudo apt update;
sudo apt full-upgrade -y;
sudo apt autoremove -y;
sudo snap refresh; # Refresh snap packages
sudo /home/nicholas/Projects/scripts/clean_snaps.sh # Remove old versions of snaps
echo "done!"

