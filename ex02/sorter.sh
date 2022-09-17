#!/bin/sh

OUTPUT_FILE="hh_sorted.csv"

#	COLORS
GREEN="\033[0;32m"
RED="\033[0;31m"
END="\033[0m"

if [ $# -eq 1 ]
  then
    INPUT_FILE=$1
  else
    echo "$RED---Specify the path to the file!---$END"
    exit
fi

{
  head -n 1 "$INPUT_FILE"
  tail -n +2 "$INPUT_FILE" | sort -t "," -k2 -k1
} > $OUTPUT_FILE

echo "$GREEN---$OUTPUT_FILE created---$END"
