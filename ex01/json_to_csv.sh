#!/bin/sh

OUTPUT_FILE="hh.csv"

#	COLORS
GREEN="\033[0;32m"
RED="\033[0;31m"
END="\033[0m"

if [ $# -eq 1 ]
  then
    jq -rf filter.jq "$1" > $OUTPUT_FILE
    echo "$GREEN---$OUTPUT_FILE created---$END"
  else
    echo "$RED---Specify the path to the file!---$END"
fi
