#!/bin/bash

# Define the command timeout duration in seconds
TIMEOUT_DURATION=3

# Open Kitty terminal
kitty zsh -c "echo 'Terminal will auto-close in $TIMEOUT_DURATION seconds'; (sleep $TIMEOUT_DURATION; pkill -P $$) & exec zsh"

