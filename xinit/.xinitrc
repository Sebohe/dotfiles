[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
exec setxkbmap -option compose:ralt &
rust-dwm-status &
exec dwm
