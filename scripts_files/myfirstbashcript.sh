#!/bin/bash

USER="Vitalii"

echo "Date:"
date

echo "Hello $USER"

echo "Current directory:"
pwd

echo "Count of bioset processes:"
ps aux | grep bioset | grep -v grep | wc -l

echo "Permissions of /etc/passwd:"
ls -l /etc/passwd | awk '{print $1}'
