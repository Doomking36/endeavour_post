#!/bin/sh

# Updating system
sudo pacman -Syu

# Install necessary packages
sudo pacman -S git doas neovim sx fastfetch imlib2 alsa-lib alsa-utils xcompmgr feh rofi firefox emacs

# Create doas.conf
sudo sh -c "echo 'permit persist :wheel' >> /etc/doas.conf"
sudo sh -c "echo 'permit nopass root' >> /etc/doas.conf"
sudo sh -c "echo 'permit nopass :wheel cmd reboot' >> /etc/doas.conf"
sudo sh -c "echo 'permit nopass :wheel cmd poweroff' >> /etc/doas.conf"

# Necessary Fonts
doas pacman -S terminus-font ttf-terminus-nerd ttf-liberation ttf-liberation-mono-nerd ttf-dejavu-nerd ttf-noto-nerd ttf-jetbrains-mono ttf-jetbrains-mono-nerd

# Clone necessary repositories and install
git clone https://github.com/siduck/chadwm --depth 1 ~/.config/chadwm
cd ~/.config/chadwm/chadwm && doas make clean install && cd ~/
cp ~/.config/chadwm/scripts/run.sh ~/

git clone https://github.com/Doomking36/st
cd st && doas make clean install && cd ~/

git clone https://github.com/nvim-lua/kickstart.nvim ~/.config/nvim

doas ln -s /usr/bin/nvim /usr/bin/vim

echo "Post-installation setup is complete. Please reboot your system."
