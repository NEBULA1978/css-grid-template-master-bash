#!/bin/bash

# Ruta al archivo CSS
archivo="grid.css"

# Función para comentar líneas
comentar_lineas() {
  local inicio=$1
  local fin=$((inicio + 9))  # Comentar las 10 líneas siguientes

  # Comentar las líneas desde $inicio hasta $fin
  sed -i "${inicio},${fin}s/^\([^/]\)/\/\/ \1/" "$archivo"
}

# Limpiar la pantalla
clear

# Mostrar las líneas del 104 al 113 con sus números correspondientes
sed -n '104,113p' "$archivo" | cat -n

# Preguntar al usuario desde qué línea desea comentar
read -p "Desde qué línea deseas comentar: " inicio_comentar

# Comentar el bloque de código desde la línea especificada
comentar_lineas "$inicio_comentar"

# Mostrar las líneas actualizadas del 104 al 113 con sus números correspondientes
sed -n '104,113p' "$archivo" | cat -n
