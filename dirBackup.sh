#!/bin/bash

BackupDir() {
	
	local FILES_LIST=$(ls $DIR_FOR_BACKUP)
	# --force-local т.к. в ином случае : воспринимается как разделитель между имя_машины:путь, из-за чего он пытается подключится этой "машине"
	tar --force-local -cvf "backup_$(date +"%T-%m-%d").tar" $FILES_LIST 
	echo "$FILES_LIST"
	exit 0

}


if [ -z $1 ]; then
	BackupDir
fi


