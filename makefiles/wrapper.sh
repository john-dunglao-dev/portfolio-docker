#!/bin/bash

# Usage: ./wrapper.sh <command> [args...]
# Example: ./wrapper.sh gcc main.c -o main

start_time=$(date +%s)

# Handle the case where the script is called with -c (shell command)
if [ "$1" = "-c" ]; then
    shift  # Remove the -c argument
    # Run the command through shell
    echo "Command: $*"
    sh -c "$*"
else
    # Run the command directly
    echo "Command: $*"
    "$@"
fi

status=$?

end_time=$(date +%s)
elapsed=$((end_time - start_time))

echo "------------- DONE -------------"
echo "Elapsed time: ${elapsed}s"

exit $status
