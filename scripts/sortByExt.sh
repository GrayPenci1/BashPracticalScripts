#!/bin/bash

##############
# сортировка файлов текущей директории по расширению
##############

WORKING_DIRECTORY=$(pwd)
SCRIPTS_FOLDER="scripts"
TEXT_FILES_FOLDER="text_files"
OTHER_FOLDER="other"

Initialize() {
[[ -d "$SCRIPTS_FOLDER" ]] || mkdir scripts
[[ -d "$TEXT_FILES_FOLDER" ]] || mkdir text_files
[[ -d "$OTHER_FOLDER" ]] || mkdir other

}

FileMovement() {
	for file in "$WORKING_DIRECTORY"/*
	do     
	       	if ! [ -d "$file" ]; then	
			local FILE_NAME="$(echo $file | awk -F "\/" '{print $NF}')"
			#echo $FILE_NAME	#FILE2=$(echo $2 | awk -F "\/" '{print $NF}')
			[[ "$file" =~ ^.*.sh$ ]] && { mv "$FILE_NAME" "$SCRIPTS_FOLDER"; continue; }
			[[ "$file" =~ ^.*.txt$ ]] && { mv "$FILE_NAME" "$TEXT_FILES_FOLDER"; continue; } || { mv "$FILE_NAME" "$OTHER_FOLDER"; continue; }
		fi
	done 
}

Main() {
	Initialize

	FileMovement
}

Main
