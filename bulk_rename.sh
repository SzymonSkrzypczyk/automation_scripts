#!/bin/bash

directory="$1"
name="$2"

if [ -z "$directory" ]
then
    echo "You have to provide a directory!"
    exit 1
fi

if [ -z $name ]
then
    name="new_name"
fi

count=0

for file in $(find "$directory" -type f)
do
    filename=$(basename -- "$file")
    parent_dir=$(dirname -- "$file")
    extension="${filename##*.}"
    mv "$file" "$parent_dir/$name$count.$extension"
    ((count++))
done
