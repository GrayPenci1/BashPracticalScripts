#!/bin/bash

# скрипт по проверке доступности сервера

TARGET_SERVER=$1

PING_RESULT=$(ping -t 200 -c 3 "$TARGET_SERVER" | grep transmitted | awk '{print $4}')

if [ $PING_RESULT -eq 0 ]; then
	echo "Сервер "$TARGET_SERVER" не доступен"
else
	echo "Сервер "$TARGET_SERVER" доступен"
fi
