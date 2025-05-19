#! /usr/bin/bash
# THIS SCRIPT IS DEPRECATED
# This is the old way of fixing vmware, now I have a more elegant solution
# that is documented in the "VMWare fixes" document in obsidian

#Navigate to appropriate directory, and remove previous keys
cd ~/Documents/VMWare/;
rm VMWARE15.priv;
rm VMWARE15.der;

#Generate keys
sudo vmware-modconfig --console --install-all;
openssl req -new -x509 -newkey rsa:2048 -keyout VMWARE15.priv -outform DER -out VMWARE15.der -nodes -days 36500 -subj "/CN=VMWARE/";
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE15.priv ./VMWARE15.der $(modinfo -n vmmon);
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE15.priv ./VMWARE15.der $(modinfo -n vmnet);

#check that the keys were generated properly, hang until user verifies
tail $(modinfo -n vmmon) | grep "Module signature appended";
read -p "Verify that the previous output states that the standard input matches, then press Enter to continue" </dev/tty;

#import key
echo "Now enter the password for the new key, I usually use \"vmware\""
sudo mokutil --import VMWARE15.der;

#Prompt the user before restarting, remind them of the password
echo "The computer will now restart, and you will be asked to enroll the key using your password.";
echo "Upon rebooting, cd into ~/Documents/VMWare, and run \"sudo mokutil --import VMWARE15.der\"";
echo "Ensure that the output reads: \"VMWARE15.der is already enrolled\"";
read -p "Press Enter to reboot the machine" </dev/tty;
sudo reboot 0;
