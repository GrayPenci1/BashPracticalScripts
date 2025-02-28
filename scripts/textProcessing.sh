#!/bin/bash

#########################
# -h - справка по скрипту
# -s <word> <file>- вывод всех строк, содержащих заданное слово в указанном текстовом файле
# -c <file> - подсчёт количества строк в указанном файле
#########################

ShowHelp() {
	echo "#########################"
	echo "# -h - справка по скрипту"
	echo "# -s <word> <file>- вывод всех строк, содержащих заданное слово в указанном текстовом файле"
	echo "# -c <file> - подсчёт количества строк в указанном файле"
	echo "#########################"
	
	exit 0
}

SearchByWord() {
	if ! [ -f "$2" ]; then
		echo "ERROR: file does not exist"
		exit 1
	fi

	grep -w "$1" "$2"
	exit 0
}

StrokeCounter() {
	if ! [ -f "$1" ]; then
	       echo "ERROR: file does not exist"
		exit 1
	fi	
	
	wc -l "$1" | awk '{print $1}'
	exit 0
}

while [ -n $1 ]
do
	case $1 in 
		-h)
			ShowHelp ;;
		-s)
			SearchByWord "$2" "$3" ;;
		-c)
			StrokeCounter "$2" ;;
		*)
			exit 0
	esac
done
