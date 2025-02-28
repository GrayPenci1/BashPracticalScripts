#!/bin/bash

##############
# -h - вывести справку
# -s - создать массив из нескольких элементов и вывести на экран
# -m - вывести максимальное число в массиве
##############


ShowHelp() {
	echo "##############"
	echo "# -h - вывести справку"
	echo "# -s - создать массив из нескольких элементов и вывести на экран"
	echo "# -m - вывести максимальное число в массиве"
	echo "##############"
	exit 0;
}

ShowArray() {
	ARRAY=(5 7 0 2)

	for i in ${ARRAY[@]}
        do
                if ! [[ "$i" =~ ^[0-9]+$ ]]; then
                        echo "Ошибка: в перечне содержится строчный символ $i"
                        exit 1
                fi
        done	
	

	echo "${ARRAY[@]}"
	exit 0
}

ShowMaxArrayElement(){
	ARRAY=( 1 6 14 5 9)
	MAX_ELEMENT=-10000

	for i in ${ARRAY[@]}
        do
                if ! [[ "$i" =~ ^[0-9]+$ ]]; then
                        echo "Ошибка: в перечне содержится строчный символ $i"
                        exit 1
                fi
        done

	for i in ${ARRAY[@]}
	do

		echo "$MAX_ELEMENT : $i"
		if [[ "$MAX_ELEMENT" -le "$i" ]]; then
			MAX_ELEMENT=$i
		fi
	done

	echo "Max element is: $MAX_ELEMENT"
	exit 0
}

while [ -n $1 ] 
do
	case $1 in 
		-h)
			ShowHelp ;;
		-s)
			ShowArray ;;	
		-m)
			ShowMaxArrayElement ;;
		*)
			echo "ERROR: unexpected symbol $1"
			exit 1;;
	esac
done
			
