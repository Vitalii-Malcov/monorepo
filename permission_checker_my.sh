#!/bin/bash

DIR="$1"
LOG="permissions.log"
COUNT=0

# очистка лога перед запуском
> "$LOG"

# проверка аргумента
if [ -z "$DIR" ]
then
    echo "Usage: ./permission_checker.sh <directory>"
    exit 1
fi

# проверка существования директории
if [ ! -d "$DIR" ]
then
    echo "Directory not found!"
    exit 1
fi

# проверка пустой директории
if [ -z "$(ls -A "$DIR")" ]
then
    echo "Directory is empty!"
    exit 0
fi

# основной цикл
for FILE in "$DIR"/*
do
    if [[ -f "$FILE" && "$FILE" == *.sh ]]
    then
        if [ -x "$FILE" ]
        then
            echo "Already executable!: $FILE"
            echo "Already executable: $FILE" >> "$LOG"
        else
            echo -e "\e[32mFixing: $FILE\e[0m"
            chmod +x "$FILE"
            echo "Fixed: $FILE" >> "$LOG"
        fi

        ((COUNT++))
    fi
done

# итог
echo "Total fixed files: $COUNT"

