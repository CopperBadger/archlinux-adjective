#!/bin/bash

echo "Configuring lemonbar"

if [[ -e "../dots/.i3/lemonbar" ]]; then
  echo -n "Lemonbar appears to aleardy be configured. Re-link it? [yN]: "
  read -r relink
  if [[ "${relink}" != "y" ]]; then
    exit 1
  fi
fi

here=$(pwd)
replace=y
if [[ -e "$HOME/Development/electrobar" ]]; then
  replace=n
  echo -n "Electrobar has already been installed. Replace it? [yN]: "
  read -r replace
  if [[ "${replace}" == "y" ]]; then
    rm -r "$HOME/Development/electrobar"
  fi
fi

mkdir -p "$HOME/Development"

if [[ "${replace}" == "y" ]]; then
  cd "$HOME/Development/"
  git clone https://github.com/AlexArendsen/electrobar.git
fi

cd ${here}
ln -fs "$HOME/Development/electrobar" ../dots/.i3/lemonbar
