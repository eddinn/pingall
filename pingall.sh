#!/bin/bash
# Program name: pingall
# Usage: pingall file.txt
date
cat "$1" | while read -r output
do
    if ping -c 1 "$output" > /dev/null
    then
      echo "node $output is up" 
    else
      echo "node $output is down"
    fi
done