#!/bin/bash

# Define the command timeout duration in seconds
TIMEOUT_DURATION=7

# Open Kitty terminal
kitty --class floatingkitty zsh -c "
echo 'Terminal will auto-close in $TIMEOUT_DURATION seconds';
# Start a subshell to manage the timeout and process termination
(
    # Wait for the specified timeout duration
    sleep $TIMEOUT_DURATION;
    # Kill the parent process group, effectively closing the terminal
    pkill -P $$
) & 
# Execute a new instance of Zsh
exec zsh"


