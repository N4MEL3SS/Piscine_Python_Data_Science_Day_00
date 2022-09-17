#!/bin/sh

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

awk -F '\",\"|T' 'NR == 1 { a=$0; next } { b=$2".csv" } !($2 in c) { c[$2]; print a > b } { print >> b }' "$INPUT_FILE"
echo "$GREEN---$INPUT_FILE is split---$END"
