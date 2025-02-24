#!/bin/bash

###############
# -h - вывести справку
# -a - вывести список всех процессов
# -k <proccessID/proccessName> - прерывание работы процесса
###############

ShowHelp() {
	echo "###############"
	echo "# -h - вывести справку"
	echo "# -a - вывести список всех процессов"
	echo "# -k <proccessID/proccessName> - прерывание работы процесса"
	echo "###############"
}

ShowAllProcesses(){
	ps -auxf
}

KillChosenProcess(){
	if [ -z $1 ]; then
		echo "Error: proccess is not established"
		exit 1
	fi

	kill -6 $1
	exit 0
}

while [ -n "$1" ]
do
	case $1 in 
		-h) ShowHelp; exit 0 ;;
		-a) ShowAllProcesses; exit 0 ;;
		-k) KillChosenProcess $2 ; exit 0 ;; 
	esac
	shift
	echo "$1"
done
