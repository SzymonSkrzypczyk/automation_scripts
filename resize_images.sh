#!/bin/bash

which -s magick
if [ $? -ne 0 ]
then
    # apt install imagemagick || brew install imagemagick
    echo "Please install imagemagick prior to using the script!"
    exit 1
fi

if [[ ! -d "$1" || ! -d "$2" ]]
then
    echo "You have to to provide directories!"
    exit 1
fi

size=$3

if [ -n $size ]
then
    size=64
fi

target_dir="$1"
output_dir="$2"
# find "$target_dir" -type f -exec sh -c 'file "{}" | grep "image" && echo "{}"' \;
for i in $(find "$target_dir" -type f)
do
    file "$i" | grep "image" &> /dev/null
    if [ $? -eq 0 ]
    then
        filename=$(basename -- "$i")
        # extension="${filename##*.}"
        magick "$i" -resize $size"x"$size "$output_dir/$filename"
    fi
done