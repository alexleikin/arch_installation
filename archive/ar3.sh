# install yay

git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg --noconfirm -si

sleep 5

yay --noconfirm humanity-icon-theme libxft-bgra otf-nerd-fonts-fira-mono otf-raleway ttf-mononoki ttf-ms-fonts yaru-icon-theme 

sleep 5

sudo pacman -S --noconfirm alacritty  nitrogen picom  firefox pcmanfm rofi xorg xf86-video-amdgpu arandr wget ttf-font-awesome xorg-xinit nerd-fonts-jetbrains-mono  pulseaudio pulseaudio-alsa arc-gtk-theme arc-icon-theme cantarell-fonts cifs-utils copyq dunst flameshot gvfs hidapi imwheel lxappearance pasystray pavucontrol pcmanfm



sed -i 's/.*ar3.*//' ~/.bashrc


cd ~/arch_installation

chmod +x install.sh
./install.sh
