xsetroot -cursor_name left_ptr
feh --bg-fill /usr/share/backgrounds/wallpaper.png
pidof pulseaudio || pulseaudio -d
dunst &
dwmblocks &
exec dwm
