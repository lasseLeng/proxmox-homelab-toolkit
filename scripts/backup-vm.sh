#!/usr/bin/env bash
# Führt ein Backup einer VM mit vzdump durch.

set -e

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <VMID> <STORAGE_OR_DIR> [--mode snapshot|suspend|stop]"
  echo "Beispiel (Storage): $0 101 local-lvm"
  echo "Beispiel (Directory): $0 101 /mnt/backup"
  exit 1
fi

VMID="$1"
TARGET="$2"
MODE="${3:---mode snapshot}"

# Prüfen, ob es ein Verzeichnis ist oder ein Proxmox-Storage-Name
if [ -d "${TARGET}" ]; then
  echo "Starte Backup von VMID ${VMID} nach Verzeichnis ${TARGET} ..."
  vzdump "${VMID}" --dumpdir "${TARGET}" ${MODE}
else
  echo "Starte Backup von VMID ${VMID} auf Storage ${TARGET} ..."
  vzdump "${VMID}" --storage "${TARGET}" ${MODE}
fi

echo "Backup abgeschlossen."
