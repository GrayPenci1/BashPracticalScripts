#!/bin/bash

#########################
# -h - вывести справку по скрипту
# -d - указать директорию бекапирования
#########################

ShowHelp() {
	echo "#########################"
	echo "# -h - вывести справку по скрипту"
	echo "# -d - указать директорию бекапирования"
	echo "#########################"

	exit 0
}

BackupDir() {
#	if [ -n $1 ]; then
#		if [ -d $1 ]; then
#			local DIR_FOR_BACKUP=$1
#			local FILES_LIST=$(ls $DIR_FOR_BACKUP)
#			echo "$FILES_LIST"
#			#tar -cvf backup_$(date +"%T-%m-%d").tar $FILES_LIST
#			exit 0
#		fi
#	fi
	
	local FILES_LIST=$(ls $DIR_FOR_BACKUP)
	tar -cvf backup_$(date +"%T-%m-%d").tar $FILES_LIST
	echo "$FILES_LIST"
	exit 0

}

while [ -n $1 ]
do
	case $1 in
		-h)
			ShowHelp ;;
		-d)
			BackupDir $2 
			shift ;;
		*)
			break ;;
	esac
	shift
done

if [ -z $1 ]; then
	BackupDir
fi


