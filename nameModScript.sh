#!/bin/bash

####################
# -h - вывести экран справки
# -p - добавить префикс к файлам в рабочей директории
# -s - добавить суффикс к файлам в рабочей директории
####################

WORKING_DIR="/home/cain/sandbox/bashScripting/destanationDir"

ShowHelp() {
	echo "####################"
	echo "# -h - вывести экран справки"
	echo "# -p - добавить префикс к файлам в рабочей директории"
	echo "# -s - добавить суффикс к файлам в рабочей директории"
	echo "####################"
}

AddPrefix() {
	# Add prefix $1
}

AddSuffix() {
	# Add suffix $1
}

while [ -n $1 ]
do
	case $1 in
		-h) ShowHelp ;;
		-p) AddPrefix $2 ;;
		-s) AddSuffix $2 ;;
		*) echo "Error while parcing"; exit 1 ;;
	esac
done

