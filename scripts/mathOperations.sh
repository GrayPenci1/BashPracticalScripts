#!/bin/bash
NUMBERS_MASK="^[0-9]+$"

FIRST_NUMB=$1
SECOND_NUMB=$2

while [ -n "$1" ]
do
	if ! [[ $1 =~ $NUMBERS_MASK ]];
	then
		echo "Minimum one of arguments is not a number"
		exit 1
	fi
	shift
done


echo $(( $FIRST_NUMB + $SECOND_NUMB))
echo $(( $FIRST_NUMB - $SECOND_NUMB))
echo $(( $FIRST_NUMB / $SECOND_NUMB))
echo $(( $FIRST_NUMB * $SECOND_NUMB))

