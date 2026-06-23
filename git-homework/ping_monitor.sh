#!/bin/bash

read -p "Введите адрес для ping: " address

fail_count=0

while true
do
    result=$(ping -c 1 -W 1 "$address")

    if [ $? -ne 0 ]; then
        fail_count=$((fail_count + 1))
        echo "$(date '+%H:%M:%S') Пинг не выполнен. Ошибка №$fail_count"
    else
        fail_count=0

        time_ms=$(echo "$result" | grep "time=" | awk -F'time=' '{print $2}' | awk '{print $1}')

        if (( $(echo "$time_ms > 100" | bc -l) )); then
            echo "$(date '+%H:%M:%S') Пинг высокий: ${time_ms} ms"
        else
            echo "$(date '+%H:%M:%S') OK: ${time_ms} ms"
        fi
    fi

    if [ "$fail_count" -ge 3 ]; then
        echo "Пинг не удался 3 раза подряд!"
        fail_count=0
    fi

    sleep 1
done
