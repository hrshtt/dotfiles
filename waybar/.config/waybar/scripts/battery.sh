#!/bin/bash

battery_dir=$(find /sys/class/power_supply -name "BAT*" | head -n 1)

if [ -z "$battery_dir" ]; then
    echo "{\"text\":\"No battery found\", \"class\":\"custom-battery\"}"
    exit 1
fi

battery_percent=$(cat "$battery_dir/capacity")
charging_status=$(cat "$battery_dir/status")

if [ "$charging_status" = "Charging" ]; then
    icon="⚡"
    class="custom-battery charging"
elif [ "$battery_percent" -le 20 ]; then
    icon="🔋"
    class="custom-battery critical"
elif [ "$battery_percent" -le 40 ]; then
    icon="🔋"
    class="custom-battery warning"
else
    icon="🔋"
    class="custom-battery"
fi

echo "{\"text\":\"${icon} ${battery_percent}%\", \"class\":\"$class\", \"percentage\":$battery_percent}"
