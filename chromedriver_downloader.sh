#!/bin/bash

links=$(curl -s "https://chromedriver.chromium.org/downloads" | sed 's/<[^>]*>/&\n/g' | 
        egrep --color "<a class=\"XqQF9c\".*?>" | sed 's/.*href="//g' | 
        sed 's/" target.*//g' | grep -v ".txt")
base="https://chromedriver.storage.googleapis.com/"

for link in $links
do
    curl -s "$link" 
done
# egrep --color "https.*?\""
