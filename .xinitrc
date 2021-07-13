xbindkeys
feh --bg-fill --randomize --no-fehbg --stretch ~/.wallpapers/*
dwm-status /home/sebas/.config/dwm-status.toml &
dunst -history_key Print --confg ~/.config/dunst.conf &
#ibus-daemon -drx
#exec startplasma-x11
exec dwm
#exec /home/sebas/repos/programs/my-penrose/target/debug/penrose &>> ~/penrose.log
#exec penrose &>> ~/penrose.log
