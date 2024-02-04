#!/bin/bash

if [ -z $1 ]
then
    files_count=10
else
    files_count=$1
fi 
page=1
url="https://catalog.data.gov/dataset/?q=&sort=views_recent+desc&page=$page"
curl -s $url | egrep --color "href=.*?accessType=DOWNLOAD" | grep "csv" | cut -d "=" -f2 | sed 's/"//' > link.txt
while [ $(cat link.txt | wc -l) -lt $files_count ]
do
    ((page++))
    url="https://catalog.data.gov/dataset/?q=&sort=views_recent+desc&page=$page"  # scrape filenames1
    curl -s $url | egrep --color "href=.*?accessType=DOWNLOAD" | grep "csv" | cut -d "=" -f2 | sed 's/"//' >> link.txt
done
if [ $(cat link.txt | wc -l) -gt $files_count ]
then
    cat link.txt | head -n $files_count > text.txt
    rm link.txt
fi

wget  -b -q -i text.txt# -P "$HOME/csvfiles/"
rm text.txt