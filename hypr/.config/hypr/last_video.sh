#!/bin/zsh

# Specify the folder path
folder_path="$HOME/Videos/"

# Find the latest mp4 or mkv file in the folder
latest_file=$(ls -t "$folder_path"/*.mkv 2>/dev/null | head -n 1)

# Check if a file was found
if [[ -n "$latest_file" ]]; then
  # Open the latest file with mpv
  mpv "$latest_file"
else
  echo "No mkv files found in the specified folder."
fi
