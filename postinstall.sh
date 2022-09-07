cd ~/arch_installation/dwm_arch/config/

mkdir ~/.local/share/fonts
cp  fonts/*  ~/.local/share/fonts
echo "set -o vi" >> ~/.bashrc
echo "alias vi=vim" >> ~/.bashrc
cp -r .vimrc .vim ~/
sudo systemctl enable --now avahi-daemon
sudo systemctl enable --now cronie

