[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xbindkeys
feh --bg-max --randomize --no-fehbg --stretch ~/.wallpapers/*
rust-dwm-status &
exec dwm
