#!/bin/bash

phrase="$1"
max_pages=$2
url="https://www.istockphoto.com/pl/search/2/image?phrase=$phrase&page=1" 
curl -s $url | awk -F 'href="' '/<a/{gsub(/".*/, "", $2); print $2}'  # lista linkow 


# potem trzeba zapisac do pliku

# potem zarzucic do wget 

# potem przeniesc

# job done :)