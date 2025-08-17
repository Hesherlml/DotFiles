#!/bin/bash

#ORPHAN ASSASIN
pkill -f "while true; do ~/.config/hypr/scripts/change_wallpaper.sh;" &

#Executes the timer
~/.config/hypr/scripts/change_wallpaper_timer.sh
