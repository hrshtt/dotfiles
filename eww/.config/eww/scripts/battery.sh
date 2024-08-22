#!/bin/bash
battery_dir=$(find /sys/class/power_supply -name "BAT*" | head -n 1)
if [ -z "$battery_dir" ]; then
    echo "No battery found"
    exit 1
fi
battery_percent=$(cat "$battery_dir/capacity")
charging_status=$(cat "$battery_dir/status")
if [ "$charging_status" = "Charging" ]; then
    icon="⚡"
    class="charging"
elif [ "$battery_percent" -le 20 ]; then
    icon="🔋"
    class="critical"
elif [ "$battery_percent" -le 40 ]; then
    icon="🔋"
    class="warning"
else
    icon="🔋"
    class=""
fi
echo "{\"text\":\"${icon} ${battery_percent}%\", \"class\":\"${class}\"}"
