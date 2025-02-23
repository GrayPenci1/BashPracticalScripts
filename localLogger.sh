#!/bin/bash

set -u

#TODO: Сдерать функцию, которая переводит аргумент в строку лога, дабы не засерать всё длинной конструкцией с echo

# скрипт, записывающий свои действия в лог-файл
DATE_SHORTCUT="date +"%Y-%m-%d_%H-%M-%S""

RemoteServerChech(){
	echo "$($DATE_SHORTCUT): Trying to ping remote server" >> scriptLog.log
	
	local PING_RESULT=$(ping -c 3 8.8.8.8 | grep transmitted |tee -a scriptLog.log | awk '{print $4}')

	if [ $PING_RESULT -eq 0 ]; then
		echo "$($DATE_SHORTCUT): Server is not awailable" >> scriptLog.log
		echo "$($DATE_SHORTCUT): Job is failed. Program execution stoped" >> scriptLog.log
		exit 1
	else
		echo "$($DATE_SHORTCUT): Server is awailable" >> scriptLog.log

	fi
	echo "$($DATE_SHORTCUT): Server check job successfuly done. Continue executing programm" >> scriptLog.log
}

CreateBackup() {
	BACKUP_NAME=backup_$(date +"%Y-%m-%d_%H")
	local FILES_LIST=$(ls | grep -v "$BACKUP_NAME")

	echo "$($DATE_SHORTCUT): Start creating backup of current directory" >> scriptLog.log
	
	if [ -f "$BACKUP_NAME".tar ]; then
		echo "Файл с именем "$BACKUP_NAME".tar уже существует. Перезаписать? (y/N)"
		read ANSWER

		if [ $ANSWER = y ]; then
			echo "$($DATE_SHORTCUT): Owerwryting existing dump" >> scriptLog.log
			tar --force-local -cvf "$BACKUP_NAME".tar $FILES_LIST >/dev/null

			if [ $? = 0 ]; then #TODO: make differenf function for this
                        	# dump successfully created
                        	echo "$($DATE_SHORTCUT): Dump created successfully" >> scriptLog.log
				return 0
                	else
                        	# error while dump creating
				echo "$($DATE_SHORTCUT): ERROR: error while dump creating" >> scriptLog.log
                        	echo "$($DATE_SHORTCUT): SCRIPT END WITH ERROR" >> scriptLog.log
                        	exit 1
                	fi
		else
			echo "Cancelling overwryting dump file. Closing program execution"
			exit 1
		fi
	else
		tar --force-local -cvf "$BACKUP_NAME".tar $FILES_LIST >/dev/null
		if [ $? = 0 ]; then #TODO: and this
			# dump successfully created
			echo "$($DATE_SHORTCUT): Dump created successfully" >> scriptLog.log
			return 0
		else
			# error while dump creating
			echo "$($DATE_SHORTCUT): ERROR: error while dump creating" >> scriptLog.log
			echo "$($DATE_SHORTCUT): SCRIPT END WITH ERROR" >> scriptLog.log
			exit 1
		fi
	fi
	echo "$($DATE_SHORTCUT): Dump creating job successfuly done. Continue executing programm" >> scriptLog.log

}

RemoveOldBackup(){
	echo "$($DATE_SHORTCUT): Start deleting old backups" >> scriptLog.log
	local LIST_OF_FILES_TO_REMOVE=$(ls *.tar | grep -v ""$BACKUP_NAME".tar")
	
	if [ $LIST_OF_FILES_TO_REMOVE ]; then
		rm "$LIST_OF_FILES_TO_REMOVE"
		echo "$($DATE_SHORTCUT): Removing files: $LIST_OF_FILES_TO_REMOVE" >> scriptLog.log
		echo "$LIST_OF_FILES_TO_REMOVE" has been deleted
	else
		echo "$($DATE_SHORTCUT): Nothing to remove" >> scriptLog.log
		echo "Nothing to delete"
	fi
	echo "$($DATE_SHORTCUT): Dump deleting job successfuly done. Continue executing programm" >> scriptLog.log
}

Main(){

	echo "$($DATE_SHORTCUT): SCRIPT START" >> scriptLog.log
	RemoteServerChech
	CreateBackup
	if [ $? = 0 ]; then
		RemoveOldBackup
	fi
	echo "$($DATE_SHORTCUT): SCRIPT END SUCCESSFUL!" >> scriptLog.log
}

Main
