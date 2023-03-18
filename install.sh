#!/usr/bin/bash


cd ~/arch_installation/dwm_arch/config


cp -r alacritty dunst dwm nitrogen picom.conf   ~/.config

cp wallpaperflare.com_wallpaper.jpg ~/Downloads
cp .xinitrc ~/.

sudo cp qt-fix.sh /etc/profile.d

mkdir ~/.config/gtk-3.0
cp gtk.css ~/.config/gtk-3.0/
cp .imwheelrc ~/.config

iface=`ip a | grep BROADCAST | awk -F': ' '{print $2}'`

sed -i "s/ens33/${iface}/" ~/arch_installation/dwm_arch/slstatus/config.h

cd ~/arch_installation/dwm_arch/dmenu
sudo make clean install

cd ~/arch_installation/dwm_arch/dwm-6.4
sudo make clean install

cd ~/arch_installation/dwm_arch/slstatus
sudo make clean install

echo 'eval "$(starship init bash)"' >> ~/.bashrc

echo  "Please reboot, login and start DWM with 'startx' command"

sleep 5
