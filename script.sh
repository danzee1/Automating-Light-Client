#!/bin/bash

# Define the interval in seconds (5 minutes = 300 seconds)
interval=300

# Run the loop indefinitely
while true; do
    # Check if the command is running within the screen session "avail"
    screen_output=$(screen -S avail -X hardcopy /dev/stdout)

    if [[ $screen_output != *"Cannot process block: Failed to connect any appropriate working node"* ]] && [[ $screen_output != *"Starting Light Client failed"* ]] && [[ $screen_output != *"Cannot initialize database"* ]] && [[ $screen_output != *"IO error: While lock file: /root/.avail/data/LOCK: Resource temporarily unavailable"* ]]; then
        # Command is not running or encountered an error, execute it
        echo "Command not running or encountered an error. Executing..."
        screen -S avail -X stuff $'curl -sL1 avail.sh | bash\n'
    elif [[ $screen_output == *"IO error: While lock file: /root/.avail/data/LOCK: Resource temporarily unavailable"* ]]; then
        # IO error encountered, execute command to remove lock file
        echo "IO error encountered. Removing lock file..."
        rm -rf /root/.avail/data/LOCK
    else
        # Command is running fine, print status
        echo "Command is running fine."
        # Sleep for the specified interval (5 minutes)
        sleep $interval
        # Move to the next iteration of the loop
        continue
    fi

    # Sleep for the specified interval (5 minutes)
    sleep $interval
done
