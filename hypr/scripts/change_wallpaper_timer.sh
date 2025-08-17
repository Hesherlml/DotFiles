#!/bin/bash

# Waits for hyprpaper
while ! hyprctl hyprpaper ls >/dev/null 2>&1
do
  sleep 0.5
done      


# Infinite loop : changes wallpaper every 10 minutes
while true
do
	~/.config/hypr/scripts/change_wallpaper.sh
	sleep 600 #seconds
done


