#!/bin/bash

# gets all the numbers between floor and ceiling and prints them out
# in a random order - one on each line
# takes two digits as input

usage(){
        echo "Usage: $0 <int floor> <int ceiling>"
        exit 1
}

[[ $# -ne 2 ]] && usage

echo $1 | grep -q "^-\?[0-9]*$"
[[ $? -ne 0 ]] && usage
echo $2 | grep -q "^-\?[0-9]*$"
[[ $? -ne 0 ]] && usage

FLOOR=$1
RANGE=$2
for i in $(seq $FLOOR $RANGE)
do
    echo $RANDOM $i
done | sort | awk '{print $2}'
