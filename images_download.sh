#!/bin/bash

if [ $# -ne 1 ]
then
    echo "You have to provide only a phrase to be searched for!"
    exit 1
fi

phrase="$1"
url="https://free-images-api.p.rapidapi.com/images/$phrase" 
touch links.txt
while read link
do
    if [ $link != "null" ]
    then
        echo $link >> links.txt
    fi

done< <(curl --request GET \
	--url $url \
	--header 'X-RapidAPI-Host: free-images-api.p.rapidapi.com' \
	--header 'X-RapidAPI-Key: 017fa9b49cmsh1614af302384761p19fed5jsn61510ee174cf' \
    -s | jq '.results[].download' | sed 's/"//g')

# potem zarzucic do wget 
wget -b -c -i links.txt
# potem przeniesc
rm -f wget-log*
rm -f links.txt