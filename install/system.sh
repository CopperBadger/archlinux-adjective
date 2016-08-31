#!/bin/bash

echo "Setting up system"

suser=$(sudo whoami)
if [[ "${suser}" != "root" ]]; then
  echo "You will have to be a sudoer to continue"
  exit 1
fi

sudo pacman -S --needed base-devel yajl wget

if [[ -z "$(pacman -Qs yaourt)" ]]; then
  echo "Installing Yaourt"
  here=$(pwd)
  mkdir -p /tmp/yaourt-install
  cd /tmp/yaourt-install

  if [[ -z "$(pacman -Qs package-query)" ]]; then
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
    tar zxvf package-query.tar.gz
    cd package-query
    makepkg
    sudo pacman -U package-query*.tar.xz
    cd ..
    rm -r package-query
  fi

  wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
  tar zxvf yaourt.tar.gz
  cd yaourt
  makepkg
  sudo pacman -U yaourt*.pkg.tar.xz
  cd ..
  rm -r yaourt

  cd ${here}
  rm -r /tmp/yaourt-install
else
  echo "Yaourt is already installed"
fi
