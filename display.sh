#!/bin/bash

LAPTOP_OUTPUT="eDP-1"
EXTERNAL_OUTPUT="HDMI-A-2"

if swaymsg -t get_outputs -r | jq -e ".[] | select(.name==\"$EXTERNAL_OUTPUT\" and .active==true)" >/dev/null; then
  echo "$EXTERNAL_OUTPUT is connected and active."

  swaymsg output "$LAPTOP_OUTPUT" disable

  swaymsg output "$EXTERNAL_OUTPUT" enable
  swaymsg output "$EXTERNAL_OUTPUT" resolution 1920x1080
  swaymsg output "$EXTERNAL_OUTPUT" position "0,0"
  swaymsg output "$EXTERNAL_OUTPUT" scale 1

  swaymsg workspace 1 output "$EXTERNAL_OUTPUT"
  swaymsg focus output "$EXTERNAL_OUTPUT"

else
  echo "$EXTERNAL_OUTPUT not connected or inactive. Using laptop screen..."

  swaymsg output "$LAPTOP_OUTPUT" enable
  swaymsg output "$LAPTOP_OUTPUT" resolution 1920x1080
  swaymsg output "$LAPTOP_OUTPUT" position "0,0"
  swaymsg output "$LAPTOP_OUTPUT" scale 1.25

  swaymsg workspace 1 output "$LAPTOP_OUTPUT"
  swaymsg focus output "$LAPTOP_OUTPUT"

fi
