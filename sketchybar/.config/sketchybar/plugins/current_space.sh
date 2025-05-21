#!/usr/bin/env sh


#SPACE_ID=$(echo "$INFO" | grep -oE 'FOCUSED_WORKSPACE=[0-9]+' | cut -d= -f2)

#if [ -z "$SPACE_ID" ]; then
  sketchybar --set "$NAME" icon="" label.drawing=off
#  exit 0
#fi

#case $SPACE_ID in
#  1)
 #   ICON=󰟐
  #  ICON_PADDING=7
  #  ;;
 # *)
 #   ICON=$SPACE_ID
 #   ICON_PADDING=10
 #   ;;
#esac

#sketchybar --set $NAME \
#            icon=$ICON \
#            icon.padding_left=$ICON_PADDING \
#            icon.padding_right=$ICON_PADDING
