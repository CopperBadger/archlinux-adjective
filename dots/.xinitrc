xrdb -load "$HOME/.Xresources"
xset +fp "$HOME/.fonts"
xset fp rehash
update-wallpaper
pulseaudio --start
reshift &
dunst &
setxkbdmap -option compose:menu
exec i3
