timedatectl set-ntp true
sfdisk /dev/vda < disk.out
mkfs.fat -F 32 /dev/vda1
pvcreate /dev/vda2
vgcreate archlinux /dev/vda2
lvcreate -L 2G archlinux -n swap
lvcreate -L 40G archlinux -n root
mkfs.ext4 /dev/archlinux/root
mkswap /dev/archlinux/swap
mount /dev/archlinux/root /mnt
cp ar2.sh ar3.sh /mnt  
chmod +x /ar2.sh /ar3.sh
mkdir /mnt/boot
mount /dev/vda1 /mnt/boot
swapon /dev/archlinux/swap
pacstrap /mnt linux linux-firmware base lvm2 networkmanager vim amd-ucode
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt 

