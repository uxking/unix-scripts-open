#!/bin/bash

# generate random data
# uses three arguments 
# first is type - num, alpha, alphanum, or all letters numbers,symbols
if [[ $# -lt 3 ]];then
    echo "Usage: $0 type size howmany"
    exit 1
fi

case $1 in
    "num") type="0-9";;
    "alpha") type="a-z";; #lower case
    "alphanum") type="a-z0-9";; # lower case
    "AlphaNum") type="A-Za-z0-9";; # upper and lower case
    "all") type="A-Za-z0-9=;:\`\"<>,./?!@#$%^&(){}[]\-_+*";; # upper and lower case

    *) echo "Sorry. Not a valid type. Valid types are num, alpha, alphanum, AlphaNum(UPPER/lower/num), all"; exit 1;;
esac

if [[ $2 -lt 1 ]];then
    echo "Sorry. Size is invalid. Must be greater than 0."
    exit 1
fi
size=$2

if [[ $3 -lt 0 ]];then
    echo "Sorry. How many is invalid. Must be greater than 0."
    exit 1
fi
# convert howmany into a negative number because that is what the head command wants
howmany=$(echo "$3 - ($3 * 2)" | bc)
cat /dev/urandom|tr -dc "$type"|fold -w $size | head "$howmany"
