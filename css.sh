#!/bin/bash

# CSS file path
css_file="grid.css"

# Función para descomentar una sección específica
descomentar_seccion() {
  local section_name="$1"
  sed -i "/\/\* $section_name \*\//,/\/\* \/$section_name \*\// s/\/\* //; s/ \*\///" "$css_file"
}

# Función para comentar todas las secciones
comentar_todas_las_secciones() {
  sed -i "s/\/* \([^ ]*\) *\*\//\/\* \1 \*\//g" "$css_file"
}

# Menú de selección
echo "Seleccione el tamaño de la caja:"
echo "1. Tres columnas con barra lateral amplia"
echo "2. Dos columnas con área de contenido principal amplia"
echo "3. Cuatro columnas con columnas distribuidas uniformemente"
echo "4. Dos filas con encabezado y pie de página altos"
echo "5. Comentar todas las secciones"
read -p "Ingrese el número de la opción deseada: " opcion

case $opcion in
  1)
    descomentar_seccion "Diseño de tres columnas con una barra lateral amplia:"
    ;;
  2)
    descomentar_seccion "Diseño de dos columnas con un área de contenido principal amplia:"
    ;;
  3)
    descomentar_seccion "Diseño de cuatro columnas con columnas distribuidas de manera uniforme:"
    ;;
  4)
    descomentar_seccion "Diseño de dos filas con un encabezado y pie de página altos:"
    ;;
  5)
    comentar_todas_las_secciones
    ;;
  *)
    echo "Opción no válida."
    ;;
esac

echo "Operación completada."
