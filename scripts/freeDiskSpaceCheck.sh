#!/bin/bash

##################################
# проверка свободного места на диске
##################################

TARGET_DISK=""
DISK_UTILIZATION_PERCENT=""


TARGET_DISK="$1"

if ! [ -d "$TARGET_DISK" ]; then
	echo "Entered not a directory"
	exit 1
fi


DISK_UTILIZATION_PERCENT=$(df -h "$TARGET_DISK" | tail -n 1 | awk -F "%" '{print $1}' | awk '{print $NF}')

if [[ $DISK_UTILIZATION_PERCENT > 90 ]]; then
	echo "WARNING: disk utilization more than 90% ($DISK_UTILIZATION_PERCENT%)"
else
	echo "ALL IS AWSOME!"
fi
