#!/bin/bash

printf "Please input few tags [E.g: food,coffee]: "
read -r tags

echo "$( /opt/homebrew/bin/jq '.tags = "'$tags'"' data.json )" > data.json