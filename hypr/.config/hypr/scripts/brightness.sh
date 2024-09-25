#!/bin/bash

# Constants
LAPTOP_MIN=5
LAPTOP_MAX=100
MONITOR_MIN=5
MONITOR_MAX=90
TOGGLE_LOW=5
TOGGLE_HIGH=90

# Function to check if monitor is connected
is_monitor_connected() {
    ddcutil detect --bus 2 > /dev/null 2>&1
    return $?
}

# Function to get current brightness
get_brightness() {
    local device=$1
    if [ "$device" = "laptop" ]; then
        brightnessctl g
    elif [ "$device" = "monitor" ] && is_monitor_connected; then
        ddcutil getvcp 10 --bus 2 | grep -oP 'current value =\s*\K[0-9]+'
    fi
}

# Function to set brightness
set_brightness() {
    local device=$1
    local value=$2
    if [ "$device" = "laptop" ]; then
        brightnessctl -q s "$value"
    elif [ "$device" = "monitor" ] && is_monitor_connected; then
        ddcutil setvcp 10 "$value" --bus 2
    fi
}

# Function to adjust brightness
adjust_brightness() {
    local device=$1
    local direction=$2
    local amount=$3
    local current=$(get_brightness "$device")
    local new

    if [ -z "$current" ]; then
        return
    fi

    if [ "$direction" = "inc" ]; then
        new=$((current + amount))
    else
        new=$((current - amount))
    fi

    if [ "$device" = "laptop" ]; then
        new=$(( new < LAPTOP_MIN ? LAPTOP_MIN : new > LAPTOP_MAX ? LAPTOP_MAX : new ))
    elif [ "$device" = "monitor" ]; then
        new=$(( new < MONITOR_MIN ? MONITOR_MIN : new > MONITOR_MAX ? MONITOR_MAX : new ))
    fi

    set_brightness "$device" "$new"
}

# Function to toggle brightness
toggle_brightness() {
    local device=$1
    local current=$(get_brightness "$device")
    local new

    if [ -z "$current" ]; then
        return
    fi

    if [ "$current" -le "$TOGGLE_LOW" ]; then
        new=$TOGGLE_HIGH
    else
        new=$TOGGLE_LOW
    fi

    set_brightness "$device" "$new"
}

# Main logic
case $1 in
    laptop|monitor|both)
        device=$1
        action=$2
        amount=$3

        case $action in
            inc|dec)
                if [ "$device" = "both" ]; then
                    adjust_brightness "laptop" "$action" "$amount"
                    if is_monitor_connected; then
                        adjust_brightness "monitor" "$action" "$amount"
                    fi
                else
                    adjust_brightness "$device" "$action" "$amount"
                fi
                ;;
            toggle)
                if [ "$device" = "both" ]; then
                    laptop_current=$(get_brightness "laptop")
                    monitor_current=$(get_brightness "monitor")
                    if [ "$laptop_current" -le "$TOGGLE_LOW" ] || ([ -n "$monitor_current" ] && [ "$monitor_current" -le "$TOGGLE_LOW" ]); then
                        set_brightness "laptop" "$TOGGLE_HIGH"
                        if is_monitor_connected; then
                            set_brightness "monitor" "$TOGGLE_HIGH"
                        fi
                    else
                        set_brightness "laptop" "$TOGGLE_LOW"
                        if is_monitor_connected; then
                            set_brightness "monitor" "$TOGGLE_LOW"
                        fi
                    fi
                else
                    toggle_brightness "$device"
                fi
                ;;
            *)
                echo "Invalid action. Use 'inc', 'dec', or 'toggle'."
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Usage: $0 {laptop|monitor|both} {inc|dec|toggle} [amount]"
        exit 1
        ;;
esac
