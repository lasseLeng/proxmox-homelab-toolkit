# Übersicht – Proxmox Homelab Toolkit

Dieses Projekt geht von einem einfachen Proxmox-Homelab aus:

- 1–3 Proxmox-Hosts (z. B. pve-node1, pve-node2, ...)
- Lokaler Storage (z. B. `local`, `local-lvm`)
- Optional: NFS/SMB-Storage für Backups

Die Skripte im Ordner `scripts/` helfen dabei:

- aus einer Basis-VM ein Template zu machen
- aus Templates schnell neue VMs zu klonen
- VMs zu sichern und Backups zu rotieren

Die Ansible-Beispiele im Ordner `ansible/` zeigen einen möglichen Weg, wie man:

- Proxmox-Hosts updatet
- Basis-Pakete installiert
- SSH/NTP konfiguriert
