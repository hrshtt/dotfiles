#!/bin/bash

# Get the current brightness
current_brightness=$(brightnessctl g)

# Check if the current brightness is less than or equal to 13
if [ "$current_brightness" -le 13 ]; then
    # Set brightness to 100%
    brightnessctl -q s 100%
else
    # Set brightness to 5%
    brightnessctl -q s 5%
fi

