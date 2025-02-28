#!/bin/bash

#############################
# -h - справка по ключам 
# -n - проверка номера
# -f - указать файл для проверки его существования
############################

showHelp() {
echo "#############################"
echo "# -h - справка по ключам"
echo "# -n - проверка номера"
echo "# -f - указать файл для проверки его существования"
echo "#############################"
}

numberCheck() {
	local REGULAR_EXP_NUMB_CHECK="^[0-9]+$"
	if ! [[ "$1" =~ $REGULAR_EXP_NUMB_CHECK ]]; then
		echo "$1 не число!"
		exit 1;
	fi

	if [[ $(($1 % 2)) == 0 ]]; then
		echo "Число $1 чётное"
	else
		echo "Число $1 нечётное"
	fi
	echo "";
}

fileCheck() {
	if ! [[ -f "$1" ]]; then
		echo "Указанного файла не существует"
	else
		echo "Указанный файл существует:"
		ls -l "$1"
	fi
	echo "";
}

while [ -n "$1" ]
do
	case $1 in
		-h)
			showHelp
			exit 0 ;;
		-n)
			NUMBER=$2
			numberCheck $NUMBER
			shift ;;
		-f)
			FILE=$2
			fileCheck $FILE
			shift ;;
		*)
			echo "$1 is not an option"
	esac
	shift
done


