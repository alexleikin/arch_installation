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
lvcreate -L 40G archlinux -n root
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

arch-chroot /mnt  /usr/bin/bash -x <<'EOF'

ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=en" > /etc/vconsole.conf
echo  archlinux > /etc/hostname

cat <<'EOF' >> /etc/hosts
127.0.0.1 localhost
::1       localhost
127.0.1.1 archlinux.localdomain archlinux
EOF

sed -i 's/block filesystems/block lvm2 filesystems/' /etc/mkinitcpio.conf
mkinitcpio -P

sleep 10

pacman --noconfirm -S grub efibootmgr networkmanager network-manager-applet os-prober linux linux-headers reflector git xdg-utils xdg-user-dirs base-devel fakeroot 

sleep 10

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl enable sshd

sleep 10

echo -n "Enter username: "
read user

echo -n "Enter password: "
read pass

useradd -mG wheel $user
echo -e "$pass\n${pass}" | passwd $user >/dev/null 2>&1
echo -e "$pass\n${pass}" | passwd root >/dev/null 2>&1

echo "$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user}

cp /ar3.sh /home/${user}
chown ${user}:${user} /home/${user}/ar3.sh
echo  "./ar3.sh" >> /home/${user}/.bashrc

echo "Exit the shell and reboot"
sleep 3

EOF
exit
reboot

