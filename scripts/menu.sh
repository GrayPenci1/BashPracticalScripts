#!/bin/bash

###################
# 1 - create file
# 2 - delete file
# 3 - exit
###################

CHOICE=""


HeaderShow() {
        echo "###################"
        echo "# 1 - create file"
        echo "# 2 - delete file"
        echo "# 3 - exit"
        echo "###################"
}

CreateFile() {
	
	echo -n "Enter the name of new file: "
	read NAME_OF_NEW_FILE

	echo $NAME_OF_NEW_FILE
	if ! [ -f "$NAME_OF_NEW_FILE" ]; then
		touch "$NAME_OF_NEW_FILE"
		echo "File created!"
	else
		echo "File with this name already exist!"
	fi
	
	clear
	HeaderShow
}

DeleteFile() {
	echo "List of awailable files:"
	ls -l
	
	echo -n "Enter name of file to delete: "
	read FILE_TO_DELETE

	echo "Are you shure want to delete file $FILE_TO_DELETE? [y/N]"
	read DELETE_CHOICE

	if [ $DELETE_CHOICE = "y" ]; then
		rm $FILE_TO_DELETE
		echo "File $FILE_TO_DELETE has been deleted"
	else
		echo "Canceling deliting file"
	fi

	clear
	HeaderShow
}

HeaderShow
read CHOICE

while ! [ "$CHOICE" = "3" ]
do
	clear
	HeaderShow

	case "$CHOICE" in 
	1) CreateFile ;;
	2) DeleteFile ;;
	3) exit 0
	esac
	read CHOICE
done
