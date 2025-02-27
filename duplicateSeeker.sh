#!/bin/bash

###########################
# поиск идентичных файлов
###########################

FILE1=$(echo $1 | awk -F "\/" '{print $NF}')
FILE2=$(echo $2 | awk -F "\/" '{print $NF}')

if [[ $(md5sum $FILE1) == $(md5sum $FILE2) ]]; then
	echo "Файлы идентичны"
else
	echo "Файлы различны"
fi
