#!/bin/bash

data=$(curl --request GET \
	--url https://open-weather13.p.rapidapi.com/city/Krakow \
	--header 'X-RapidAPI-Host: open-weather13.p.rapidapi.com' \
	--header 'X-RapidAPI-Key: 017fa9b49cmsh1614af302384761p19fed5jsn61510ee174cf' \
    -s | jq '.main.temp, .main.feels_like, .weather[0].description')
echo $data

#mail data