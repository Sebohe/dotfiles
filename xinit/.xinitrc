[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
feh --bg-max --randomize --no-fehbg --stretch ~/.wallpapers/*
rust-dwm-status &
exec dwm
