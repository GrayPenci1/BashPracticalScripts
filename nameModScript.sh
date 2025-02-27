#!/bin/bash

####################
# -h - вывести экран справки
# -p - добавить префикс к файлам в рабочей директории
# -s - добавить суффикс к файлам в рабочей директории
####################

WORKING_DIR="$(pwd)/destanationDir"
WORKING_TYPE=""

ShowHelp() {
	echo "####################"
	echo "# -h - вывести экран справки"
	echo "# -p - добавить префикс к файлам в рабочей директории"
	echo "# -s - добавить суффикс к файлам в рабочей директории"
	echo "####################"
	exit 0
}

FilesNameModify() {
	if [ "$WORKING_TYPE" = "prefix" ]; then
		for file in $WORKING_DIR/*
        	do
                	mv $file $WORKING_DIR/$1$(echo $file | awk -F "\/" '{print $NF}')
                	#echo "$file $WORKING_DIR/$1$(echo $file | awk -F "\/" '{print $NF}')"
        	done
        	exit 0
	else 
		if [ "$WORKING_TYPE" = "postfix" ]; then
			for file in $WORKING_DIR/*
                	do
                        	mv "$file $WORKING_DIR/$(echo $file | awk -F "\/" '{print $NF}')$1"
                        	#echo "$file $WORKING_DIR/$(echo $file | awk -F "\/" '{print $NF}')$1"
                	done
                	exit 0
		else
			echo "Invalid work type"
		fi
	fi
}


XFIX=""
#echo "$WORKING_DIR"

while [ -n "$1" ]
do
	case $1 in
		-h) ShowHelp ;;
		-p) WORKING_TYPE="prefix"; XFIX=$2; shift 2 ;;
		-s) WORKING_TYPE="postfix"; XFIX=$2; shift 2 ;;
		*) echo "Error while parcing"; exit 1 ;;
	esac
done

if [ -n "$XFIX" ]; then
	FilesNameModify "$XFIX"
else
	echo "No xFix entered"
fi
