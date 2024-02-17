#!/usr/bin/bash

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

hyprpaper &

wl-paste --type text --watch cliphist store & #Stores only text data

wl-paste --type image --watch cliphist store & #Stores only image data 

#mpvpaper -o "--loop" HDMI-A-1 $HOME/.config/wallpapers/neutron-star-desktop-wallpaperwaifu-com.mp4 &
#mpvpaper -o "--loop" eDP-1 $HOME/.config/wallpapers/neutron-star-desktop-wallpaperwaifu-com.mp4 &

