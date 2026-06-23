#!/bin/bash

BASE_DIR="/opt/060326-ptm/Vitalii_Malcov"
ARCH_DIR="/tmp/Arh"
UNPACK_DIR="/opt/newfolder"

mkdir -p "$BASE_DIR"
mkdir -p "$ARCH_DIR"
mkdir -p "$UNPACK_DIR"

for i in {1..5}
do
    DIR_NAME="$BASE_DIR/Dir$i"
    mkdir -p "$DIR_NAME"

    for j in {1..5}
    do
        FILE_NAME="$DIR_NAME/File$j.txt"
        date +"%H-%M-%S" > "$FILE_NAME"
        sleep 5
    done

    echo "Files in $DIR_NAME:"
    ls "$DIR_NAME"
done

TODAY=$(date +"%d-%m-%Y")
ARCHIVE_NAME="Arh-$TODAY.tar.gz"

tar -czf "$ARCH_DIR/$ARCHIVE_NAME" -C "$BASE_DIR" Dir1 Dir2 Dir3 Dir4 Dir5

tar -tf "$ARCH_DIR/$ARCHIVE_NAME" > "$ARCH_DIR/ArhList.txt"

mkdir -p "$UNPACK_DIR"

tar -xzf "$ARCH_DIR/$ARCHIVE_NAME" -C "$UNPACK_DIR"

echo "Archive created: $ARCH_DIR/$ARCHIVE_NAME"
echo "Archive list created: $ARCH_DIR/ArhList.txt"
echo "Unpacked to: $UNPACK_DIR"
echo "Done!"
