#!/bin/bash
# #######################################################################################
# # /* ---- 🐧 https://github.com/Solrojo-Script 🐧 ---- */  #
# #######################################################################################
wallpaper_directory=~/.config/wallpaper
wallpaper_history=~/.config/hypr/scripts/wallpaper_history.txt


#If the history file doesn't exist, it's created
touch "$wallpaper_history"


#Read the last used wallpapers
wallpaper_last=($(tail -n 4 "$wallpaper_history"))

#Looks for wallpapers not found in the history file
#Note: shuf picks 1 random wallpaper 
#Note: grep -Ff reverse the search (v) and looks for string patterns (F) in the file (f)
if [ ${#wallpaper_last[@]} -eq 0 ]
then
    wallpaper=$(find "$wallpaper_directory" -type f | shuf -n 1)
else
    wallpaper=$(find "$wallpaper_directory" -type f | grep -v -Ff  "$wallpaper_history" | shuf -n 1)
fi

#Load wallpaper
hyprctl hyprpaper preload "$wallpaper"
hyprctl hyprpaper wallpaper , "$wallpaper"
sleep 1
hyprctl hyprpaper unload unused

#Update history file with current wallpaper
echo "$wallpaper" >> "$wallpaper_history"

#Only preserve the last 4 used wallpapers in the history
tail -n 4 "$wallpaper_history" > "$wallpaper_history.tmp" && mv "$wallpaper_history.tmp" "$wallpaper_history"

exit 0
