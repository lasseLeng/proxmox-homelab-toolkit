#!/usr/bin/env bash
# Wandelt eine existierende VM in ein Template um.

set -e

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <VMID>"
  exit 1
fi

VMID="$1"

echo "Erstelle Template aus VMID ${VMID} ..."
qm template "${VMID}"

echo "Fertig. VMID ${VMID} ist jetzt ein Template."
