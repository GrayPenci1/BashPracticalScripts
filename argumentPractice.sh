#!/bin/bash

################
# -h - вывести справку по скрипту
# -s <number1> <number2> - вывести сумму аргументов
# -c <file> - вывести содержимое файла
################

ShowHelp() {
	echo "################"
	echo "# -h - вывести справку по скрипту"
	echo "# -s <number1> <number2> - вывести сумму аргументов"
	echo "# -c <file> - вывести содержимое файла"
	echo "################"

	exit 0
}


SumOfNumbers() {
	if [[ ($1 =~ ^[0-9]+$) && ($2 =~ ^[0-9]+$) ]]; then
		echo "$1 + $2 = $(($1+$2))"
		exit 0
	else
		echo "ОШИБКА: минимум один аргумент не является числом"
		exit 1
	fi
}

FileContainmentShow() {
	if ! [[ -f $1 ]]; then
		echo "Ошибка: файла $1 не существует"
		exit 1
	fi

	echo "Содержимое файла:"
	cat $1
	exit 0
}

while [ -n $1 ]
do
	case $1 in
		-h)
			ShowHelp ;;
		-s)
			SumOfNumbers $2 $3 ;;
		-c)
			FileContainmentShow "$2" ;;
		*)
			echo "Невалидный ключ"
			exit 0 ;;
	esac
	shift
done
