#!/bin/bash

FILE_TO_CHANGE=""
CHANGEBLE_WORD=""
NEW_WORD=""

if [ -z "$1" ]; then
	echo "<file_name> <what_to_change> <on_what_change>"
	exit 0
fi

if ! [[ (-f "$1") || (-n "$2") ]]; then
	echo "Error: not valid enter"
	exit 1
else
	FILE_TO_CHANGE="$1"
	CHANGEBLE_WORD="$2"
	NEW_WORD="$3"	
fi

sed -i "s/"$CHANGEBLE_WORD"/$NEW_WORD/g" "$FILE_TO_CHANGE" 2> /dev/null

if [ $? = 1 ]; then
	echo "Error: fail while replacing"
	exit 1
fi
#echo "'s/"$CHANGEBLE_WORD"/$NEW_WORD/g' "$FILE_TO_CHANGE""

