#!/bin/bash

if [ $# -eq 0 ]
then
    echo "You have to provide only a phrase to be searched for!"
    exit 1
elif [ $# -gt 2 ]
then
    echo "You have to provide two arguments tops!"
    exit 1
fi

phrase="$1"
if [ -z $2 ]
then
    name="default"
else
    name="$2"
fi

url="https://free-images-api.p.rapidapi.com/images/$phrase" 
touch links.txt
count=0
while read link
do
    if [ $link != "null" ]
    then
        #echo $link >> links.txt
        wget -b -c -O "$name$count.jpg" $link
        ((count++))
    fi

done< <(curl --request GET \
	--url $url \
	--header 'X-RapidAPI-Host: free-images-api.p.rapidapi.com' \
	--header 'X-RapidAPI-Key: 017fa9b49cmsh1614af302384761p19fed5jsn61510ee174cf' \
    -s | jq '.results[].download' | sed 's/"//g')

# wget -b -c -i links.txt
# potem przeniesc
rm -f wget-log*
# rm -f links.txt