#!/bin/bash

if [ ! -d "$1" ]
then
    echo "You have to provide a directory!"
    exit 1
fi

text=$(find "$1" -type f -exec sh -c 'file "{}" | grep -q -i "text" && echo "{}"' \;)
echo "Yooo"
image=$(find "$1" -type f -exec sh -c 'file "{}" | grep -q -i "image" && echo "{}"' \;)
pdf=$(find "$1" -type f -exec sh -c 'file "{}" | grep -q -i "PDF" && echo "{}"' \;)
scripts=$(find "$1" -type f -exec sh -c 'file "{}" | grep -q -i "script" && echo "{}"' \;)
audio=$(find "$1" -type f -exec sh -c 'file "{}" | grep -q -i "audio" && echo "{}"' \;)
csv=$(find "$1" -type f -exec sh -c 'file "{}" | grep -q -i "csv" && echo "{}"' \;)
html=$(find "$1" -type f -exec sh -c 'file "{}" | grep -q -i "html" && echo "{}"' \;)
echo $text