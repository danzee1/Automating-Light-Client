#!/bin/bash

# Define the interval in seconds (10 minutes = 600 seconds)
interval=300

# Run the loop indefinitely
while true; do
    # Check if the command is running within the screen session "avail"
    screen_output=$(screen -S avail -X hardcopy /dev/stdout)

    if [[ $screen_output != *"Cannot process block: Failed to connect any appropriate working node"* ]]; then
        # Command is not running or encountered an error, execute it
        echo "Command not running or encountered an error. Executing..."
        screen -S avail -X stuff $'curl -sL1 avail.sh | bash -s -- --identity /root/avail-light-client/identity.toml\n'
    else
        # Command is running fine, print status
        echo "Command is running fine."
    fi

    # Sleep for the specified interval (5 minutes)
    sleep $interval
done
