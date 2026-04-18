#!/usr/bin/env bash

BASE_DIR="$HOME/Pictures/wallpaper"
LAST_WALLPAPER_FILE="/tmp/last_wallpaper"

pgrep awww-daemon >/dev/null || awww-daemon &
sleep 1

while true; do
  HOUR=$(date +%H)

  if [ "$HOUR" -ge 06 ] && [ "$HOUR" -lt 14 ]; then
    FOLDER="morning"
    TRANSITION="grow"
    Duration=1
  elif [ "$HOUR" -ge 14 ] && [ "$HOUR" -lt 21 ]; then
    FOLDER="afternoon"
    TRANSITION="wipe"
    DURATION=1.2
    ANGLE=45
  else
    FOLDER="night"
    TRANSITION="fade"
    DURATION=2
  fi

  LAST_IMG=""
  if  [ -f "$LAST_WALLPAPER_FILE" ]; then
    LAST_IMG=$(cat "$LAST_WALLPAPER_FILE")
  fi

  while true; do
    [ ! -d "$BASE_DIR/$FOLDER" ]; && break

      NEW_IMG=$(ls "$BASE_DIR/$FOLDER" | shuf -n 1)
      COUNT=$(ls "$BASE_DIR/$FOLDER" | wc -l)

      [ "$COUNT" -eq 0 ] && break

      if [ "$COUNT" -le 1 ] || [ "$NEW_IMG" !=  "$LAST_IMG" ]; then
        break
      fi
  done

  if [ -n "$NEW_IMG" ]; then
    IMG_PATH="$BASE_DIR/$FOLDER/$NEW_IMG"

    if [ "$TRANSITION" = "wipe" ]; then
      awww img "$IMG_PATH" \
        --transition-type "$TRANSITION" \
        --transition-angle "$ANGLE" \
        --transition-duration "$DURATION" \
    else
      awww img "$IMG_PATH" \
        --transition-type "$TRANSITION"
        --transition-duration "$DURATION"
    fi

    echo "$NEW_IMG" > "$LAST_WALLPAPER_FILE"
  fi

  sleep 600
done
