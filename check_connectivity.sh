#!/bin/bash

host="$1"
count=$2

if [ -z $host ]
then
    echo "You have to provide a host!"
    exit 1
fi

if [ -n $count ]
then
    count=4
fi

ping -c $count "$host" &> /dev/null

if [ $? -eq 0 ]
then
    echo "$1 is reachable!"
    exit 0
else
    echo "$1 is not reachable!"
    exit 1 
fi