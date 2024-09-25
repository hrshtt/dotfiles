#!/bin/bash

battery_dir=$(find /sys/class/power_supply -name "BAT*" | head -n 1)
capacity=$(cat "$battery_dir/capacity")
status=$(cat "$battery_dir/status")

# Generate icon string based on battery level and charging status
if [ "$status" = "Charging" ]; then
    if [ "$capacity" -eq 100 ]; then
        icon="battery-level-100-charged-symbolic"
    else
        level=$((($capacity + 9) / 10 * 10))
        icon="battery-level-${level}-charging-symbolic"
    fi
elif [ "$status" = "Full" ]; then
    icon="battery-full-symbolic"
else
    if [ "$capacity" -eq 100 ]; then
        icon="battery-level-100-charged-symbolic"
    else
        level=$((($capacity + 9) / 10 * 10))
        icon="battery-level-${level}-symbolic"
    fi
fi

# Echo the icon name
echo "$icon"

