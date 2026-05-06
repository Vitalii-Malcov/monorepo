#!/bin/bash
TEST_DIR="/opt/060326-ptm/Vitalii_Malcov"
#read -p "Enter pash: " TEST_DIR
#TEST_DIR="$1"

for FILE in "$TEST_DIR"/*
do
if [ -d "$FILE" ]
then
echo "it's directory $FILE"
else
echo "It's file $FILE"
fi
done

