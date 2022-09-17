#!/bin/sh

OUTPUT_FILE="hh_uniq_positions.csv"
TEMP_FILE="temp.csv"

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
  echo -n '"Junior",'
  grep -c "Junior" "$INPUT_FILE"

  echo -n '"Middle",'
  grep -c "Middle" "$INPUT_FILE"

  echo -n '"Senior",'
  grep -c "Senior" "$INPUT_FILE"
} > $TEMP_FILE

{
  echo '"name","count"'
  sort -t "," -k2 -k1 -r "$TEMP_FILE"
} > $OUTPUT_FILE

echo "$GREEN---$OUTPUT_FILE created---$END"
rm -rf $TEMP_FILE
