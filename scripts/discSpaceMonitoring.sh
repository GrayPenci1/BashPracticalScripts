#!/bin/bash

#############
# мониторинг использования диска. Вывод топ 10 директорий по размеру
#############

WORKING_DIR=""

WORKING_DIR="$1"

if [ "$WORKING_DIR" = "" ]; then
	echo "Working dir doesn't set"
	exit 1
fi

if ! [ -d "$WORKING_DIR" ]; then
	echo "There is no entered directory"
	exit 1
fi

du -h "$WORKING_DIR" | sort -r | head -n 10
