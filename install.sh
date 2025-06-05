#!/bin/bash
clear
echo "###########################################################"
echo "###                  Updating system                    ###"
echo "###########################################################"
sudo pacman -Syu --noconfirm --needed

clear
echo "###########################################################"
echo "###                   Installing Yay                    ###"
echo "###########################################################"
sudo pacman -S --noconfirm --needed base-devel
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si
cd ~/install-script

clear
echo "###########################################################"
echo "###                  Cloning dotfiles                   ###"
echo "###########################################################"
git clone https://gitlab.com/dwt1/dotfiles
git clone https://gitlab.com/dwt1/wallpapers

yay -S --noconfirm --needed - < pkglist.txt

cp -r ~/dotfiles/.config/qtile ~/dotfiles/.config/alacritty ~/dotfiles/.config/emacs ~/dotfiles/.config/conky ~/dotfiles/.config/picom ~/dotfiles/.config/rofi ~/dotfiles/.config/starship.toml ~/.config/
cp -r ~/dotfiles/.bashrc ~/

curl -sS https://starship.rs/install.sh | sh
git clone https://gitlab.com/dwt1/shell-color-scripts
cd shell-color-scripts/
makepkg -cf
sudo pacman -U *.pkg.tar.zst
cd ~
