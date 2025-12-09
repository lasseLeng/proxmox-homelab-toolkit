#!/usr/bin/env bash
# Listet alle VMs auf dem Proxmox-Host in kompakter Form.

set -e

echo "Liste der VMs auf diesem Proxmox-Host:"
echo "--------------------------------------"
qm list
echo
echo "Hinweis: 'qm list' zeigt VMID, Status, Name und Ressourcen."
