#!/usr/bin/env bash
# Klont eine neue VM aus einem Template.

set -e

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <TEMPLATE_VMID> <NEW_VMID> <NEW_NAME> [<TARGET_NODE>]"
  echo "Beispiel: $0 9000 101 test-vm-01 pve-node1"
  exit 1
fi

TEMPLATE_VMID="$1"
NEW_VMID="$2"
NEW_NAME="$3"
TARGET_NODE="${4:-}"

CMD=(qm clone "${TEMPLATE_VMID}" "${NEW_VMID}" --name "${NEW_NAME}")

if [ -n "${TARGET_NODE}" ]; then
  CMD+=("--target" "${TARGET_NODE}")
fi

echo "Klone VM aus Template ${TEMPLATE_VMID} -> neue VM ${NEW_VMID} (${NEW_NAME}) ..."
echo "Kommando: ${CMD[*]}"
"${CMD[@]}"

echo "Du kannst jetzt Netzwerk, CPU, RAM etc. mit 'qm set' anpassen, z.B.:"
echo "  qm set ${NEW_VMID} --memory 4096 --cores 4"
