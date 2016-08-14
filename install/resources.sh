#!/bin/bash

if [[ -z "$(pacman -Qs yaourt)" ]]; then
  echo "Yaourt isn't installed, please install it first."
  exit 1
fi

yaourt -S --needed xorg-server xorg-xinit feh rofi ttf-font-awesome powerline-fonts-git pulseaudio pulseaudio-ctl noto-fonts conky xorg-xrandr i3-gaps-git python-i3-git xorg-xprop neovim lemonbar-xft-git zsh rxvt-unicode archey3 dunst

mkdir -p "$HOME/.fonts"
if [[ ! "$(fc-match "Knack Nerd Font")" =~ "Knack" ]]; then
  echo "Installing Hack Powerline font..."
  wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Bold/complete/Knack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf -O "$HOME/.fonts/knackttf"
  xset fp rehash
  fc-cache -f ~/.fonts
else
  echo "Hack Powerline font already installed."
fi
