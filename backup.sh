#!/bin/bash
BACKUP_DIR=~/backups
LOG_FILE=backup.log
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p $BACKUP_DIR

if [[ $# -eq 0 ]]; then
  echo "Foydalanish: ./backup.sh <papka1> <papka2> ..."
  exit 1
fi

for FOLDER in "$@"; do
  if [[ -d $FOLDER ]]; then
    ARCHIVE_NAME="${FOLDER}_${TIMESTAMP}.tar.gz"
    tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$FOLDER"
    echo "[$TIMESTAMP] OK: $FOLDER -> $ARCHIVE_NAME" >> $LOG_FILE
    echo "✔ $FOLDER zaxiralandi: $ARCHIVE_NAME"
  else
    echo "[$TIMESTAMP] XATO: $FOLDER topilmadi" >> $LOG_FILE
    echo "✘ $FOLDER topilmadi"
  fi
done
