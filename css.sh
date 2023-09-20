#!/bin/bash

# Ruta al archivo CSS
archivo="grid.css"

# Función para comentar una línea específica
comentar_linea() {
  local linea=$1
  sed -i "${linea}s/^/\/\*/" "$archivo"
  sed -i "${linea}s/$/\*\//" "$archivo"
}

# Limpiar la pantalla
clear

# Mostrar las líneas del archivo con números de línea
cat -n "$archivo"

# Preguntar al usuario desde qué línea desea comentar
read -p "Desde qué línea deseas comenzar a comentar: " inicio_comentar
read -p "Hasta qué línea deseas terminar de comentar: " fin_comentar

# Comentar las líneas especificadas por el usuario
while [ "$inicio_comentar" -le "$fin_comentar" ]
do
  comentar_linea "$inicio_comentar"
  inicio_comentar=$((inicio_comentar + 1))
done

# Mostrar las líneas actualizadas del archivo
cat -n "$archivo"
