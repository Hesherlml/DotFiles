#!/bin/bash

wallpaper_directory=~/.config/wallpaper
wallpaper_history=~/.config/hypr/scripts/wallpaper_history.txt


#Crear el archivo del historial si no exite
touch "$wallpaper_history"


#Leer los ultimos 4 wallpapers utilizados
wallpaper_last=($(tail -n 32 "$wallpaper_history"))

#Busca wallpapers que no se encuentren en el historial
#Nota: shuf selecciona 1 wallpaper al azar
#Nota: grep -Ff invierte la busqueda (v) y busca patrones fijos de string (F) en el archivo (f)
if [ ${#wallpaper_last[@]} -eq 0 ]
then
    wallpaper=$(find "$wallpaper_directory" -type f | shuf -n 1)
else
    wallpaper=$(find "$wallpaper_directory" -type f | grep -v -Ff  "$wallpaper_history" | shuf -n 1)
fi

#Cargar el wallpaper
hyprctl hyprpaper preload "$wallpaper"
hyprctl hyprpaper wallpaper , "$wallpaper"
sleep 1
hyprctl hyprpaper unload unused

#Actualiza el archivo historial
echo "$wallpaper" >> "$wallpaper_history"

#Mantener solo los 4 ultimos wallpapers en el historial
tail -n 32 "$wallpaper_history" > "$wallpaper_history.tmp" && mv "$wallpaper_history.tmp" "$wallpaper_history"

exit 0
