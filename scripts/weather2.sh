#!/usr/bin/env bash

################################
# Shows info about the weather (in Cincinnati) from accuweather.com
################################

full=""
short=""
color=""
status=0


URL='https://www.accuweather.com/en/ar/san-miguel-de-tucuman/11869/weather-forecast/11869'
SITE="$(curl -s "$URL")"

weather="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $14 }'| head -1)"
temp="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12"°" }'| head -1)"


if [[ $weather == *thunder* || $weather == *Thunder* ]]; then
    icon=""
else
    if [[ $weather == *rain* || $weather == *Rain* ]]; then
        icon=""
    else
        if [[ $weather == *cloud* || $weather == *Cloud* ]]; then
            icon=""
        else
            icon=""
        fi
    fi
fi


full="$icon $temp"
short="$temp"


echo $full
echo $short
echo $color
exit $status