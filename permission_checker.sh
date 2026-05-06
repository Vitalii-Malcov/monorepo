#!/bin/bash

DIR="/opt/060326-ptm"

for FILE in "$DIR"/*/*.sh
do
    echo "File: $FILE"
    ls -l "$FILE"
    chmod +x "$FILE"
done
