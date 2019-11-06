#exec startplasma
feh --bg-fill --randomize --no-fehbg --stretch ~/.wallpapers/*
/home/sebas/.cargo/bin/dwm-status /home/sebas/.config/dwm-status.toml &
dunst -history_key Menu &
exec dwm
