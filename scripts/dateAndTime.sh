#!/bin/bash

#####################
# -h - вывести справку по скрипту 
# -s - показать текущие дату и время
# -f - создат файл с текущей датой в наименовании
#####################

ShowHelp() {
	echo "#####################"
	echo "# -h - вывести справку по скрипту"
	echo "# -s - показать текущие дату и время"
	echo "# -f - создат файл с текущей датой в наименовании"
	echo "#####################"

	exit 0
}

ShowDateAndTime() {
	date +"%Y-%m-%d"
	exit 0
}

CreateFile() {
	local CUR_DATE=$(date +"%Y-%m-%d")
	touch newFile_$CUR_DATE.txt
	exit 0
}

while [ -n $1 ]
do
	case $1 in
		-h)
			ShowHelp ;;
		-s)
			ShowDateAndTime ;;
		-f)
			CreateFile ;;
		*)
			exit 1;;
	esac
done
