#!/bin/bash


for i in {1..10}
do
    echo "$(date +"%H:%M:%S") $(ps -ef | wc -l)"
    sleep 5
done


cat /proc/cpuinfo > cpuinfo.txt


grep "^NAME=" /etc/os-release > os_name.txt


grep "^NAME=" /etc/os-release | awk -F= '{print $2}' | tr -d '"' > os_name_clean.txt


for i in {50..100}
do
    touch "$i.txt"
done

echo "Done!"
