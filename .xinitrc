xbindkeys
feh --bg-fill --randomize --no-fehbg --stretch ~/.wallpapers/*
dwm-status /home/sebas/.config/dwm-status.toml &
dunst -history_key Print --confg ~/.config/dunst.conf &
#exec startkde
#exec startplasma-x11
exec dwm
