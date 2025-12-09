#!/usr/bin/env bash
# Löscht alte Backup-Dateien in einem Verzeichnis nach Anzahl oder Alter.

set -e

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <BACKUP_DIR> <KEEP_COUNT> [--dry-run]"
  echo "Beispiel: $0 /mnt/backup 5"
  exit 1
fi

BACKUP_DIR="$1"
KEEP_COUNT="$2"
DRY_RUN="$3"

if [ ! -d "${BACKUP_DIR}" ]; then
  echo "Fehler: Verzeichnis ${BACKUP_DIR} existiert nicht."
  exit 1
fi

echo "Rotation der Backups in ${BACKUP_DIR}, es sollen ${KEEP_COUNT} Dateien behalten werden."

FILES_TO_DELETE=$(ls -1t "${BACKUP_DIR}" | sed -e "1,${KEEP_COUNT}d")

if [ -z "${FILES_TO_DELETE}" ]; then
  echo "Keine alten Backups zu löschen."
  exit 0
fi

echo "Folgende Dateien werden gelöscht:"
echo "${FILES_TO_DELETE}"

if [ "${DRY_RUN}" = "--dry-run" ]; then
  echo "Dry-Run aktiviert – es wird nichts gelöscht."
  exit 0
fi

echo "${FILES_TO_DELETE}" | while read -r FILE; do
  rm -f "${BACKUP_DIR}/${FILE}"
done

echo "Rotation abgeschlossen."
