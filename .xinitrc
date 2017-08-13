setxkbmap -option compose:ralt

synclient tapButton1=1

while true; do
    $(go run /home/sebas/suckless/go-dwmstatus/dwmstatus.go)
done  &


feh --randomize --bg-fill ~/Pictures/Wallapers/* &

exec dwm
