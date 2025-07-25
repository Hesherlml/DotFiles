#!/bin/bash

# Esperar a que hyprpaper cree su socket
while ! hyprctl hyprpaper ls >/dev/null 2>&1
do
  sleep 0.5
done      


# Bucle infinito para cambiar fondo cada 10 minutos
while true
do
	~/.config/hypr/scripts/change_wallpaper.sh
	sleep 600 #segundos
done


