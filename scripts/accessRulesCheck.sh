#!/bin/bash


##############################
# Check access for files
##############################

echo "List of files with access rules different with 600"
find ~ \( -type f -not -perm 600 \) > accessRulles.txt


