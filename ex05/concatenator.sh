#!/bin/sh

OUTPUT_FILE="concatenate.csv"

#	COLORS
GREEN="\033[0;32m"
RED="\033[0;31m"
END="\033[0m"

FILES_COUNT=$(find . -name "*.csv" -not -name $OUTPUT_FILE | wc -l)

if [ "$FILES_COUNT" -eq 0 ]
  then
    echo "$RED---Not found csv files!---$END"
    exit
fi
{
  echo "\"id\",\"created_at\",\"name\",\"has_test\",\"alternate_url\""
  find . -name "*.csv" -not -name "concatenate.csv" -print0 | xargs -0 cat | sed -En '/^"id\",\"created_at\",\"name\",\"has_test\",\"alternate_url\"$/!p'
} > $OUTPUT_FILE

echo "$GREEN---$OUTPUT_FILE created---$END"
