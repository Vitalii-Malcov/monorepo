#!/bin/bash

read -p "Каталог: " folder
read -p "Возраст файлов: " days
 
list=$(find "$folder" -type f -mtime +"$days")

read -p "Удалить? yes/no: " ans
 
if [ "$ans" = "yes" ]; then
    rm $list
    echo "Готово"
fi
