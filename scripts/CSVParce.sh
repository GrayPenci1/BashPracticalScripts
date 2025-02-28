#!/bin/bash

############################
# <file_name> <colums_to_show> - читает файл и выводит указанные столбцы
###########################
LIST_OF_TABLES=""
TARGET_FILE=""

FileEstablishCheck() {
	
	if ! [[ -f "$1" ]]; then
                # проверка, что первый аргумент - это существующий файл
                echo "Error: first argument is not a file"
                exit 1
        else
		echo "$1"
                if ! [[ "$1" =~ .*.csv ]]; then
                        # если файл существует, но не подходит по расширению - пускаем лесом
                        echo "Error: file is not suitable"
                        exit 1

                else
                        # в ином случае - записываем в переменную, шифтуем к аргументам и идём дальше
                        TARGET_FILE="$1"                      
                fi
        fi
}

while [ -n "$1" ]
do
	
	if [ "$TARGET_FILE" = "" ]; then
		FileEstablishCheck $1
		shift 1
		continue
	fi


	if ! [[ "$1" =~ ^[0-9]+$ ]]; then
		echo "Error: one of argument is not a number"
		exit 1
	fi
	
#	if [ "$LIST_OF_TABLES" = "" ]; then
#		LIST_OF_TABLES="\$$1"
#	else
#		LIST_OF_TABLES="$LIST_OF_TABLES \$$1"
#	fi

	shift 1
	echo "loop"
done

cat $TARGET_FILE | awk -F "," -v li="$LIST_OF_TABLES" '{ print $2 "  " $3 }'

#echo "$LIST_OF_TABLES"
echo "$TARGET_FILE"
