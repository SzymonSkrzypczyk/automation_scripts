#!/bin/bash

which -s identify
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

target_dir="$1"
output_dir="$2"

images=$(find "$target_dir" -type f -exec sh -c 'file "{}" | grep -q "image" && echo "{}"' \;)
echo $images