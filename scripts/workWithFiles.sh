#!/bin/bash

#########################
# -h - вывести справку по скрипту
# -t - создать тестовый файл и записать в него строку "Это тестовый файл"
# -c <file> <dir> - скопировать файл в указанную директорию
# -d <.ext> - удалить файлы в текущей директории с указанным расширением
#########################

ShowHelp(){
	echo "#########################"
	echo "# -h - вывести справку по скрипту"
	echo "# -t - создать тестовый файл и записать в него строку \"Это тестовый файл\""
	echo "# -c <file> <dir> - скопировать файл в указанную директорию"
	echo "# -d <.ext> - удалить файлы в текущей директории с указанным расширением"
	echo "#########################"
	
	exit 0
}

CreateTestFile() {
	local FILENAME="testFile_$(date +"%T").txt"
	touch $FILENAME
	echo "Это тестовый файл" > $FILENAME
	
	exit 0
}

CopyFileToDir(){
	if ! [[ -f $1 ]]; then
		echo "ОШИБКА: Указанного файла не существует"
		exit 1
	fi

	if ! [[ -d $2 ]]; then
		echo "ОШИБКА: Указанной директории не существует"
		exit 1
	fi

	cp $1 $2
	exit 0
}

DeleteAllWithExtention() {
	local EXTENTION_MASK="$1"
	local APPROVEMENT_RESULT

	echo "Будут удалены следующие файлы:"
	ls -l *.$EXTENTION_MASK
	echo "Вы уверены, что хотите удалить все файлы текущей директории $(pwd) с расширением $EXTENTION_MASK?(y/N)"
	read APPROVEMENT_RESULT
	
	if [[ $APPROVEMENT_RESULT == "y" ]]; then
		echo "Удаляю файлы"
		ls -l *.$EXTENTION_MASK
		rm *.$EXTENTION_MASK
		return 0;
	else
		return 0;
	fi
	
}

while [ -n "$1" ]
do
	case $1 in
		-h)
			ShowHelp
			exit 0 ;;
		-t)
			CreateTestFile
			exit 0 ;;
		-c)
			FILENAME=$2
			DEST_DIR=$3
			CopyFileToDir $FILENAME $DEST_DIR
			exit 0 ;;
		-d)
			EXTENTION=$2
			DeleteAllWithExtention $EXTENTION
			exit 0 ;;
		*)
			echo "ERROR: невалидный ключ"
			exit 1 ;;
	esac
done
