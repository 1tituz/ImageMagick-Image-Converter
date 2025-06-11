# ImageMagick Stapel-Konvertierer -> jpg, jpeg, gif, png ZU webp Dateien
Weil Bimp in Gimp 3 nicht mehr funktioniert :(

***Dependencies:*** imagemagick

***Was macht das Script?***  
Gib den Pfad zu deinen Bilddateien (jpg, jpeg, gif oder png) an und wandle diese in webp Dateien um.

***Eingestellt werden kann:***
- **Höhe** und **Breite** in Pixel Angeben (Eine von beiden Angaben kann frei gelassen werden um die Dimensionen beizubehalten).
- **DPI** (Muss angegeben werden)
- Die **Qualität** des webps (Muss angegeben werden)


***Wie verwenden:***
- Speichere die Datei ***webpConvert.sh*** in einem Ordner.
- Öffne diesen Ordner im Terminal und mach die Datei ausführbar: `chmod +x webpConvert.sh`
- Starte das Script mit: `./webpConvert.sh`


Ein funktionierendes GIMP 3.0 Plugin gibts hier:
https://github.com/kamilburda/batcher
