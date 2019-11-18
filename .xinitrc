#exec startplasma
xbindkeys
feh --bg-fill --randomize --no-fehbg --stretch ~/.wallpapers/*
dwm-status /home/sebas/.config/dwm-status.toml &
dunst -history_key Menu --confg ~/.config/dunst.conf &
exec dwm
