xrdb -load "$HOME/.Xresources"
xset +fp "$HOME/.fonts"
xset fp rehash
update-wallpaper
pulseaudio --start
reshift &
dunst &
setxkbdmap -option compose:menu
xfce4-power-manager &
exec i3

# exec qemu-launch /home/copper/Downloads/ubuntu-16.04-desktop-amd64.iso
