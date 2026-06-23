#!/bin/bash

for file in dir/*; do
    filename=$(basename "$file")

    if (( filename % 2 == 0 )); then
        mv "$file" dir1/
    fi
done
