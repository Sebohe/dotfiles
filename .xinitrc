#exec startplasma
xbindkeys
feh --bg-fill --randomize --no-fehbg --stretch ~/.wallpapers/*
gods &
dunst -history_key Print --confg ~/.config/dunst.conf &
exec dwm
