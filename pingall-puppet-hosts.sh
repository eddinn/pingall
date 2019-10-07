#!/bin/bash
# Program name: pingall.sh
date
puppet cert list --all | awk '{print $2}' | tr -d '"' > /tmp/all-nodes.txt
cat /tmp/all-nodes.txt | while read -r output
do
    if ping -c 1 "$output" > /dev/null
    then
      echo "node $output is up" 
    else
      echo "node $output is down"
    fi
done