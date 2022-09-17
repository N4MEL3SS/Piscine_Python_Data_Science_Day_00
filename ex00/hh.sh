#!/bin/sh

API="https://api.hh.ru/vacancies"
OUTPUT_FILE="hh.json"
PER_PAGE="20"

#	COLORS
GREEN="\033[0;32m"
END="\033[0m"

if [ $# -eq 1 ]
  then
    VACANCY=$(echo "$1" | sed "s/ /%20/")
  else
    VACANCY='data%20scientist'
fi

curl -s -H "User-Agent: api-test-agent" -G "$API?text=$VACANCY&per_page=$PER_PAGE" | jq > $OUTPUT_FILE
echo "$GREEN---$OUTPUT_FILE created---$END"
