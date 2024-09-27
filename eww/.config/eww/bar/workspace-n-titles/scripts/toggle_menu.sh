#!/bin/bash

LOCK_FILE_WIFI="$HOME/.cache/eww-wifi-menu.lock"
LOCK_FILE_BT="$HOME/.cache/eww-bluetooth-menu.lock"
EWW_BIN="eww"

toggle_menu() {
    local widget=$1
    local lock_file=$2

    if [[ ! -f "$lock_file" ]]; then
        ${EWW_BIN} close wifi_menu bluetooth_menu
        ${EWW_BIN} open "$widget"
        touch "$lock_file"
    else
        ${EWW_BIN} close "$widget"
        rm "$lock_file"
    fi
}

if [ "$1" = "wifi" ]; then
    toggle_menu "wifi_menu" "$LOCK_FILE_WIFI"
elif [ "$1" = "bluetooth" ]; then
    toggle_menu "bluetooth_menu" "$LOCK_FILE_BT"
fi
