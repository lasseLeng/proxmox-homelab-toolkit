

---

## `docs/backup-strategy.md`

```markdown
# Backup-Strategie – Beispiel

Dieses Projekt geht von einer einfachen, aber sinnvollen Backup-Strategie aus:

- Tägliche Backups der wichtigsten VMs
- Aufbewahrung von z. B. 5–7 Backups pro VM
- Speicherung auf separatem Storage (NFS oder USB/HDD)

Beispiel-Cronjob (root auf Proxmox-Host):

```bash
# Tägliches Backup von VM 101 auf Storage "local"
0 3 * * * /root/proxmox-homelab-toolkit/scripts/backup-vm.sh 101 local >> /var/log/backup-101.log 2>&1

# Rotation im lokalen Backup-Verzeichnis
30 3 * * * /root/proxmox-homelab-toolkit/scripts/rotate-backups.sh /mnt/backup/vm-101 7 >> /var/log/backup-101-rotate.log 2>&1
