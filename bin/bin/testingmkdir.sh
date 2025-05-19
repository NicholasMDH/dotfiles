read -p "Enter the directory name to back up VMs to: " directory
full_path="/tmp/$directory/"
read -p "You entered: $full_path. is this correct? [y/n]" correct

# test if they entered y(es) or n(o)
case $correct in
  y ) echo "Perfect";;
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

# ensure folder exists before backing up
if [ ! -d "$full_path" ]; then
  echo "something went wrong when trying to create the backup directory, exiting."
  exit
else
  cp -p /tmp/testfile $full_path
fi

echo "checking if the file got copied over"
ls -l "$full_path"

