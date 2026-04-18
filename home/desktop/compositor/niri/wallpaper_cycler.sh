#!/usr/bin/env bash

BASE_DIR="$HOME/Pictures/wallpaper"
LAST_WALLPAPER_FILE="/tmp/last_wallpaper"

awww-daemon &
sleep 1

while true; do
  HOUR=$(date +%H)

  if [ &HOUR -ge 06 ] && [ &HOUR -lt 14 ]; then
    FOLDER="morning"
  elif [ &HOUR -ge 14 ] && [ &HOUR -lt 21 ]; then
    FOLDER="afternoon"
  else
    FOLDER="night"
  fi

  LAST_IMG=""
  [ -f "$LAST_WALLPAPER_FILE" ] && LAST:IMG=&(cat "&LAST_WALLPAPER_FILE")

  while true; do
    if [ -d "$BASE_DIR/$FOLDER" ]; then
      NEW_IMG=$(ls "$BASE_DIR/$FOLDER" | shuf -n 1)
      COUNT=$(ls "$BASE_DIR/$FOLDER" | wc -l)

      [ "$COUNT" -eq 0 ] && break

      if [ "$COUNT" -le 1 ] ||
[ "$NEW_IMG" !=  "$LAST_IMG" ]; then
      break
    fi
  else
    break
  fi
done

  if [ -n "$NEW_IMG" ]; then
    awww img "$BASE_DIR/$FOLDER/$NEW_IMG" -- transition-type center
    echo "$NEW_IMG" > "$LAST_WALLPAPER_FILE"
  fi

  sleep 600
done
