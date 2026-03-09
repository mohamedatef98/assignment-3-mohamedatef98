#!/bin/sh
# Check if exactly 2 arguments are provided
if [ "$#" -eq 2 ]; then
    filesdir=$1
    searchstr=$2

    # Check if the path exists and is a directory
    if [ -d "$filesdir" ]; then
        # Calculate matches and files using POSIX-compliant grep
        # Using -r is standard in most modern grep versions
        num_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)
        
        # We filter out lines that don't have matches (count > 0) to get the file count
        num_files=$(grep -r -c "$searchstr" "$filesdir" | grep -v ":0$" | wc -l)
        
        echo "The number of files are $num_files and the number of matching lines are $num_matches"
    else
        echo "$filesdir isn't a directory"
        exit 1
    fi
else
    echo "Wrong number of arguments"
    exit 1
fi