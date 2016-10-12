#!/bin/bash

echo "Linking .config..."

mkdir -p "$HOME/.config/"

for f in ../config/*/; do
  dirname=$(basename ${f})
  replace=y
  if [[ -e "$HOME/.config/${dirname}" ]]; then
    mkdir -p "$HOME/.config/${dirname}"
    replace=n
    echo -n "Configuration for ${dirname} already exists. Replace it? [yN]: "
    read -r replace
  fi
  if [[ "${replace}" == "y" ]]; then
    echo "Linking in config for ${dirname}"
    ln -fs "$(realpath ${f})" "$HOME/.config/${dirname}" 
  fi
done

echo "Linking X11..."

for f in ../x11/*.conf; do
  fname=$(basename ${f})
  replace=y
  if [[ -e "/etc/X11/xorg.conf.d" ]]; then
    replace=n
    echo -n "X11 configuration ${fname} already exists. Replace it? [yN]: "
    read -r replace
  fi
  if [[ "${replace}" == "y" ]]; then
    echo "Linking in x11 configuration for ${dirname}"
    ln -fs "$(realpath ${fname})" "/etc/X11/xorg.conf.d/${fname}" 
  fi
done
