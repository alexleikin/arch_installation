lsblk | grep sda > /dev/null  2>&1

if  [[ $? -eq 0  ]]
then
	disk=sda
else
	disk=vda
fi

sed -i "s/disk/$disk" disk.out



timedatectl set-ntp true
sfdisk /dev/$disk < disk.out
mkfs.fat -F 32 /dev/${disk}1
pvcreate /dev/${disk}2
vgcreate archlinux /dev/${disk}2
lvcreate -L 2G archlinux -n swap
lvcreate -L 20G archlinux -n root
mkfs.ext4 /dev/archlinux/root
mkswap /dev/archlinux/swap
mount /dev/archlinux/root /mnt
cp ar2.sh ar3.sh /mnt  
chmod +x /ar2.sh /ar3.sh
mkdir /mnt/boot
mount /dev/${disk}1 /mnt/boot
swapon /dev/archlinux/swap
pacstrap /mnt linux linux-firmware base lvm2 networkmanager vim amd-ucode
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt chmod +x ar2.sh
arch-chroot /mnt /ar2.sh

