#! /usr/bin/bash

# This script is the new simpler way to fix vmware
cd /home/nicholas/Documents/VMWare/vmware-host-modules-workstation-17.5.0
make
sudo vmware-modconfig --console --install-all
