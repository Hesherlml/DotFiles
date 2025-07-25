#!/bin/bash

#ASESINO DE HUERFANOS
pkill -f "while true; do ~/.config/hypr/scripts/change_wallpaper.sh;" &

#Ejecutar el timer
~/.config/hypr/scripts/change_wallpaper_timer.sh
