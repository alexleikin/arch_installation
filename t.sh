
lsblk | grep sda > /dev/null  2>&1

if  [[ $? -eq 0 ]]
then
disk=sda
fi

echo $disk


