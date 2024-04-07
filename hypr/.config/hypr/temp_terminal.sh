#!/bin/bash

# Define the command timeout duration in seconds
TIMEOUT_DURATION=7

# Open Kitty terminal
kitty --class floatingkitty zsh -c "echo 'Terminal will auto-close in $TIMEOUT_DURATION seconds'; (sleep $TIMEOUT_DURATION; pkill -P $$) & exec zsh"

