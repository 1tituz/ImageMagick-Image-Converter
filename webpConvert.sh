#!/bin/bash

FINDPATH () {
    clear
    echo;echo;
    echo -e "ImageMagick - KONVERTIERE jpg, jpeg, gif und png ZU webp"
    echo -e "--------------------------------------------------------"
    echo;echo;echo;
    read -p "Pfad zum Bilderordner eingeben: " pfad
    echo;echo;
    echo -e "Gefundene Bilddateien:"
    echo;

    mapfile -t images < <(find "$pfad" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.png" \) | sort -f)

    for pic in "${images[@]}"; do
   
    details=$(identify -format "Größe: %wx%h Pixel, DPI: %x x %y\n" "$pic")

    bildname=$(basename "$pic")
    echo -e "$details -> $bildname"
   
    done

    SETTINGS
}

SETTINGS () {
    echo;echo;
    echo -e "Größen Angaben in Pixel, nur einen Größenwert notwendig:"
    echo
    read -p "         Höhe: " height
    read -p "       Breite: " width
    echo;
    echo -e "DPI Wert eingeben 72 für Web, 300 für Print:"
    echo;
    read -p "          dpi: " dpi
    echo;
    echo -e "Qualtität der webp einstellen, zwischen 75 - 80 ist empfohlen:"
    echo;
    read -p "webp qualität: " quali

    CONVERT
}

CONVERT () {
    echo;echo;
    echo -e "#### KONVERTIERE"
    echo;

    for file in "${images[@]}"; do
    echo -e "Konvertiere: $file"
    magick "$file" -resize "$width"x"$height"\> -density "$dpi" -quality "$quali" -units PixelsPerInch "${file%.*}.webp"
    done

    mkdir -p "$pfad"/bearbeitet
    find "$pfad" -maxdepth 1 -type f -name "*.webp" -exec mv "{}" "$pfad"/bearbeitet \;

    echo;
    echo -e "ERLEDIGT #######"
    echo;echo;echo;

    read -p "[enter] = Start | [q] = quit : " slct
    if [[ -z $slct ]]; then
        unset images
        FINDPATH
    else
        exit
    fi
}
FINDPATH