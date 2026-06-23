#!/bin/bash
#
if [ $# -eq 0 ]; then
echo "Error! "
exit 1
fi

COUNT="$1"
DIR_PATH="/opt/060326-ptm/Vitalii_Malcov/FOLDER2"

mkdir -p $DIR_PATH
echo $COUNT

for ((i=1; i<=COUNT; i++))
do
FILE_NAME="DIR_PATH/file-$i.$RANDOM"
RANDOM_TEXT=$(head /dev/urandom | head -c 100)
echo "$RANDOM_TEXT" > "$FILE_NAME"

#for FILE in "$DIR_PATH"/*
#do
#echo $FILE
#cat $FILE

