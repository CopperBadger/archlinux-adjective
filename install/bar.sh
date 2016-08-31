#!/bin/bash

echo "Configuring lemonbar"

if [[ -e "../dots/.i3/lemonbar" ]]; then
  echo -n "Lemonbar appears to aleardy be configured. Re-link it? [yN]: "
  read -r relink
  if [[ "${relink}" != "y" ]]; then
    exit 1
  fi
fi

ln -fs "$(realpath ../bar)" ../dots/.i3/lemonbar
