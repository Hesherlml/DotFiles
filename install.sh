#!/bin/bash
# Script to install Solrojo-Script's DotFiles
# Dotfiles include : hyprland, hyprpaper, hyprlock, waybar, wlogout, wofi and kitty
#
#This includes the scripts for changing the wallpaper with hyprpaper (~/.config/hypr/scripts) + wallpapers (~/.config/wallpaper).
#
#This also includes the folder icons of Adwaita++ with Suru++
#
# WARNING : Make sure you have the following applications and fonts already installed before executing this script : hyprland hyprpaper hyprlock hyprpolkitagent waybar wlogout wofi kitty nwg-look xdg-desktop-portal-hyprland xdg-desktop-portal-gtk nautilus git ttf-font-awesome ttf-jetbrains-mono-nerd wget

#Copying files
if [ ! -d ~/.config/hypr ]; then
	mkdir  ~/.config/hypr
fi
cp -r hypr/* ~/.config/hypr/

if [ ! -d ~/.config/kitty ]; then
	mkdir  ~/.config/kitty
fi
cp -r kitty/* ~/.config/kitty/

mv wallpaper ~/.config/

if [ ! -d ~/.config/waybar ]; then
	mkdir ~/.config/waybar
fi
cp -r waybar/* ~/.config/waybar/

if [ ! -d ~.config/wlogout ]; then
	mkdir ~/.config/wlogout
fi
cp -r wlogout/* ~/.config/wlogout/

if [ ! -d ~/.config/wofi ]; then
	mkdir ~/.config/wofi
fi
cp -r wofi/* ~/.config/wofi/

#Making scripts for wallpaper executable
cd ~/.config/hypr/scripts
chmod +x change_wallpaper.sh change_wallpaper_timer.sh change_wallpaper_wrapper.sh

cd /tmp/
rm -rf DotFiles

#WARNING : YOU'LL NEED nwg-look, xdg-desktop-portal-gtk and xdg-desktop-portal-hyprland FOR THE NEXT PART 

#Icons install (Suru ++ with Adwaita++)
git clone https://github.com/Bonandry/adwaita-plus.git
cd adwaita-plus
chmod +x install.sh && ./install.sh
cd ..
rm -rf adwaita-plus

git clone https://github.com/gusbemacbe/suru-plus-folders.git
cd suru-plus-folders
chmod +x install.sh && ./install.sh
cd ..
rm -rf suru-plus-folders

#Aplying icon theme and 'GOING DARK'
suru-plus-folders -C purple --theme Adwaita++
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita++'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
nwg-look -a

printf "\nDONE AND ENJOY :D\n"
