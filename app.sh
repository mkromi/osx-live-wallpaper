#!/bin/bash

Xaxis=$(/usr/sbin/system_profiler SPDisplaysDataType | awk '/Resolution/{print $2}')
Yaxis=$(/usr/sbin/system_profiler SPDisplaysDataType | awk '/Resolution/{print $4}')

tags=$(/opt/homebrew/bin/jq -r '.tags' $PWD/osx-live-wallpaper/data.json)

IFS=', ' read -r -a array <<< "$tags"
size=${#array[@]}
index=$(($RANDOM % $size))

file=$(/opt/homebrew/bin/jq -r '.file' $PWD/osx-live-wallpaper/data.json)
if [ $file == "wallpaper1" ]; then echo "$( /opt/homebrew/bin/jq '.file = "wallpaper2"' $PWD/osx-live-wallpaper/data.json )" > $PWD/osx-live-wallpaper/data.json
else echo "$( /opt/homebrew/bin/jq '.file = "wallpaper1"' $PWD/osx-live-wallpaper/data.json )" > $PWD/osx-live-wallpaper/data.json
fi

echo -e "GET https://source.unsplash.com HTTP/1.0\n\n" | nc source.unsplash.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    curl -L https://source.unsplash.com/${Xaxis}x${Yaxis}?${array[$index]} --output $PWD/osx-live-wallpaper/$file
    osascript -e 'tell application "System Events" to tell every desktop to set picture to "'$PWD/osx-live-wallpaper/$file'"'
fi