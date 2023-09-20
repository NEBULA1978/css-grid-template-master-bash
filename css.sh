#!/bin/bash

# Ruta al archivo CSS
archivo="grid.css"

# Función para agregar /* al principio de la línea inicial
agregar_comentario_inicio() {
  local linea_inicio=$1
  sed -i "${linea_inicio}s/^/\/\*/" "$archivo"
}

# Función para agregar */ al final de la línea final
agregar_comentario_fin() {
  local linea_fin=$1
  sed -i "${linea_fin}s/$/\*\//" "$archivo"
}

# Función para quitar comentarios /* */ de una línea
quitar_comentarios() {
  local linea=$1
  sed -i "${linea}s/\/\*//" "$archivo"
  sed -i "${linea}s/\*\///" "$archivo"
}

# Limpiar la pantalla
clear

while true; do
  # Mostrar las líneas del archivo con números de línea
  cat -n "$archivo"

  # Mostrar el menú
  echo "Menú:"
  echo "1. Agregar comentario al principio y final de líneas"
  echo "2. Quitar comentarios de una línea a otra línea"
  echo "3. Salir"

  # Leer la opción del usuario
  read -p "Selecciona una opción (1/2/3): " opcion

  case $opcion in
    1)
      # Preguntar al usuario desde qué línea desea agregar comentarios
      read -p "Desde qué línea deseas comenzar a agregar comentarios: " inicio_comentar
      read -p "Hasta qué línea deseas terminar de agregar comentarios: " fin_comentar
      agregar_comentario_inicio "$inicio_comentar"
      agregar_comentario_fin "$fin_comentar"
      ;;
    2)
      # Preguntar al usuario desde qué línea desea quitar comentarios
      read -p "Desde qué línea deseas quitar los comentarios: " inicio_quitar_comentarios
      read -p "Hasta qué línea deseas quitar los comentarios: " fin_quitar_comentarios
      for ((linea = inicio_quitar_comentarios; linea <= fin_quitar_comentarios; linea++)); do
        quitar_comentarios "$linea"
      done
      ;;
    3)
      # Salir del programa
      exit 0
      ;;
    *)
      echo "Opción no válida. Por favor, selecciona una opción válida (1/2/3)."
      ;;
  esac
done
