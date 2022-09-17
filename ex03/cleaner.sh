#!/bin/sh

OUTPUT_FILE="hh_positions.csv"

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

head -n 1 "$INPUT_FILE" > $OUTPUT_FILE
tail -n +2 "$INPUT_FILE" | awk \
	'BEGIN { FS = OFS = "," }
	{
		STR = ""
		if (index(tolower($3), "junior"))
			STR = STR"Junior/"
		if (index(tolower($3), "middle"))
			STR = STR"Middle/"
		if (index(tolower($3), "senior"))
			STR = STR"Senior"
		if (STR == "")
			STR = "-"
		gsub(/[\/ ]*$/, "", STR)
		$3 = "\""STR"\""
	print }' \
>> $OUTPUT_FILE

echo "$GREEN---$OUTPUT_FILE created---$END"
