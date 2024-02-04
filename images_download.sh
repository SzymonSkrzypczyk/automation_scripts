#!/bin/bash

# phrase="$1"
# max_pages=$2
url="https://pixabay.com/images/search/tree/?order=ec&pagi=2" 
# curl -s $url | awk -F 'href="' '/<a/{gsub(/".*/, "", $2); print $2}'  # lista linkow 
curl -s $url

# potem trzeba zapisac do pliku

# potem zarzucic do wget 

# potem przeniesc

# job done :)