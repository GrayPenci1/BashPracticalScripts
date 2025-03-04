#!/bin/bash

####################################
# system report creator
####################################


REPORT_FILE=reportResult.txt

if ! [ -f "$REPORT_FILE" ]; then
	touch "$REPORT_FILE"
fi

echo "###############################REPORT_START###############################" > "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "RAM utilization:" >> "$REPORT_FILE"
free -h >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Disk space utilization:" >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Hardware information:" >> "$REPORT_FILE"
sudo lshw -short >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "CPU information:" >> "$REPORT_FILE"
lscpu >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Block devices:" >> "$REPORT_FILE"
lsblk >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "System version:" >> "$REPORT_FILE"
cat /proc/version >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "###############################REPORT_END###############################" >> "$REPORT_FILE"
