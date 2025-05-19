# get user input
read -p "Enter the directory name to back up VMs to: " directory
full_path="/media/nicholas/red_backup/$directory/"
read -p "You entered: \"$full_path\" is this correct? [y/n]" correct

# test if they entered y(es) or n(o)
case $correct in
  y ) echo "Perfect, continuing";;
  n ) echo "Ope, try again";
      exit;;
esac

# test if the directory already exists, and if not create it
if [ -d "$full_path" ]; then
  echo "$full_path already exists, exiting..."
  exit
else
  mkdir "$full_path"
fi

# create the directory

# ensure folder exists before backing up
if [ ! -d "$full_path" ]; then
  echo "something went wrong when trying to create the backup directory, exiting."
  exit
else
  echo "Starting Backup, backing up OpenBSD"
  cp -p -R /media/nicholas/Vault/VMs/OpenBSD_COPY/ /media/nicholas/red_backup/$directory
  echo "OpenBSD completed, backing up FreeBSD"
  cp -p -R /media/nicholas/Vault/VMs/FreeBSD/ /media/nicholas/red_backup/$directory
  echo "FreeBSD completed, backing up RockyLinux"
  cp -p -R /media/nicholas/Vault/VMs/RockyLinux/ /media/nicholas/red_backup/$directory
  echo "RockyLinux completed, backing up UbuntuLinux"
  cp -p -R /media/nicholas/Vault/VMs/UbuntuLinux/ /media/nicholas/red_backup/$directory
  echo "UbuntuLinux completed, backing up OpenIndiana/Solaris"
  cp -p -R /media/nicholas/Vault/VMs/OpenIndiana/ /media/nicholas/red_backup/$directory
  echo "OpenIndiana/Solaris completed, backing up ESXi"
  cp -p -R /media/nicholas/Vault/VMs/ESXi/ /media/nicholas/red_backup/$directory
  echo "Finished backup!"
fi

