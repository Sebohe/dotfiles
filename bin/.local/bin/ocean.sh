#!/usr/bin/env bash
amixer set Master 50%
while :
do
  mpg123 -k 2000 $HOME/audios/ocean.mp3
  sleep 0.2
  mpg123 -k 2000 $HOME/audios/ocean.mp3
  sleep 0.2
  mpg123 $HOME/audios/deorro.mp3
  sleep 0.2
done
