#!/bin/bash

# date= $(date +%y-%m-%d)

# chmod 774 ./DIR/*

echo "Permission of all files : " 
ls -l ./DIR

echo "Files which are less than 50mb : " 
find ./DIR -type f -size -50M

echo "Backuped files : " 
tar -czvf ./backup_$(date +%y-%m-%d).tar.gz ./DIR

