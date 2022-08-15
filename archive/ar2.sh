ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=en" > /etc/vconsole.conf
echo  archlinux > /etc/hostname

cat <<'EOF' >> hhh
127.0.0.1 localhost
::1       localhost
127.0.1.1 archlinux.localdomain archlinux
EOF

sed -i 's/block filesystems/block lvm2 filesystems/' /etc/mkinitcpio.conf
mkinitcpio -P


pacman --noconfirm -S grub efibootmgr networkmanager network-manager-applet os-prober linux linux-headers reflector git xdg-utils xdg-user-dirs base-devel fakeroot 

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl enable sshd

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

exit
reboot

