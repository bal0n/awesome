#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Programas a ejecutar.
run compton                   # Compton para gestión de transparencias
run xbindkeys                 # Atajos de teclado con xbindkeys (config en .xbindkeysrc)
run unclutter                 # Unclutter para ocultar el ratón
run numlockx                  # Marca numlock (Bloq Num)
run mate-power-manager        # Carga el Power Manager de Mate
run urxvtd -q                 # Ejecución del demonio de urxvt
run xrdb -merge ~/.Xresources # Recarga de xrdb 
run ntpd -qg                  # Ajuste de varios minutos en la hora con ntp
run mate-appearance-properties --show-page fonts # Carga de fuentes de texto de mate