#!/bin/bash

##################
# -h - справка 
# -e1 - выводит числа от 1 до 10
# -e2 - выводит чётные числа от 1 до 20
# -f - выводит все файлы в текущей директории
##################

showHelp() {
	echo "##################"
	echo "# -h - справка"
	echo "# -e1 - выводит числа от 1 до 10"
	echo "# -e2 - выводит чётные числа от 1 до 20"
	echo "# -f - выводит все файлы в текущей директории"
	echo "##################"
}

numbersShow() {
	for (( i = 1; i <=10; i++ ))
	do
		echo "$i"
	done
}

evenNumbersShow() {
	for (( i = 1; i <= 20; i++ ))
	do
		if [[ $(($i % 2)) == 0 ]]; then
			echo "$i"
		fi
	done
}

showAllFiles() {
	ROUTE=$(pwd)
	for file in $ROUTE/*
	do
		echo "$file" | awk -F "/" '{print $NF}' 
		echo "---------------------------"
		cat $file
		echo ""
	done
}

while [ -n "$1" ]
do
	case "$1" in
		-h)
			showHelp
			exit 0 ;;
		-e1)
			numbersShow
			exit 0 ;;
		-e2)
			evenNumbersShow
			exit 0 ;;
		-f)
			showAllFiles
			exit 0 ;;
		*)
			echo "Некорректный ключ. Для справки запустите скрипт с ключём -h"
			exit 1 ;;
	esac
done
