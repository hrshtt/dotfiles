#!/bin/bash

# Change directory to your code directory
cd ~/Code

# Check if Jupyter Lab is already running
if pgrep -x "jupyter-lab" > /dev/null
then
    notify-send -t 2000 "Jupyter Lab is already running."
    exit 1
else
    notify-send -t 2000 "Starting Jupyter Lab..."
    # Activate the Python environment
    source .jpy-env/bin/activate

    # Start Jupyter Lab
    jupyter lab --no-browser &

    sleep 2

    firefox -P jupyter --kiosk "http://localhost:8888/lab" &
fi
