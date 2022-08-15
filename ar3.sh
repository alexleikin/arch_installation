# install yay

git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg --noconfirm -si

sleep 5

yay -S --noconfirm humanity-icon-theme otf-nerd-fonts-fira-mono otf-raleway ttf-mononoki ttf-ms-fonts yaru-icon-theme

sleep 5

sudo pacman -S --noconfirm alacritty  nitrogen picom  firefox pcmanfm rofi xorg xf86-video-amdgpu arandr wget ttf-font-awesome xorg-xinit  pulseaudio pulseaudio-alsa arc-gtk-theme arc-icon-theme cantarell-fonts cifs-utils copyq dunst flameshot gvfs hidapi imwheel lxappearance pasystray pavucontrol pcmanfm alsa-utils ttf-jetbrains-mono ttf-iosevka-nerd




sed -i 's/.*ar3.*//' ~/.bashrc


cd ~/

git clone https://github.com/alexleikin/arch_installation.git

cd ~/arch_installation

chmod +x install.sh
./install.sh
