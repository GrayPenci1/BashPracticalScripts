#!/bin/bash

if [ -z $1 ]; then
	echo "Введите имя файла для подсчёта слов"
	exit 1
fi

if [ -f $1 ]; then
	echo "$(cat "$1" | wc -w)"
	exit 0
else
	echo "Указанный аргумент не является файлом"
	exit 1
fi
