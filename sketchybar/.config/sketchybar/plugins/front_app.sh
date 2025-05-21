#!/usr/bin/env sh

ICON_PADDING_RIGHT=10

case $INFO in
 
  "Discord")
    ICON=
    ;;
 
  "Finder")
    ICON=󰀶
    ;; 
  "Spotify")
    ICON=
    ;;
  "WezTerm")
    ICON=
    ;;
    "Brave Browser")
    ICON=󰜏
    ;;
  *)
    ICON=
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
