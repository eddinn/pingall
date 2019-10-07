#!/bin/bash
# Program name: pingall.sh
date
puppet cert list --all | awk '{print $2}' | tr -d '"' > /tmp/all-nodes.txt
cat /tmp/all-nodes.txt |  while read output
do
    ping -c 1 "$output" > /dev/null
    if [ $? -eq 0 ]; then
    echo "node $output is up" 
    else
    echo "node $output is down"
    fi
done
