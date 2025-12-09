# Proxmox Homelab Toolkit

Dieses Repository enthält Skripte und Beispiel-Automatisierung für ein Proxmox VE Homelab / kleine Umgebung.

Fokus:

- Schnelles Erstellen von VM-Templates
- Klonen von VMs aus Templates
- Einfache Backup-Skripte für VMs
- Beispielhafte Ansible-Playbooks für Basis-Konfiguration
- Dokumentation zur Netzwerk- und Backup-Strategie

> Hinweis: Alle Skripte sind als Beispiel gedacht. Bitte **immer** erst in einer Testumgebung ausprobieren.

---

## Inhalt

- `scripts/` – Shell-Skripte für Proxmox CLI (qm, vzdump, etc.)
- `ansible/` – Beispiel-Ansible-Playbook zur Basis-Konfiguration von Proxmox-Hosts
- `docs/` – Architekturbeschreibung, Netzwerk-Setup und Backup-Strategie

---

## Schnellstart

1. Repository klonen:

```bash
git clone https://github.com/lasseLeng/proxmox-homelab-toolkit.git
cd proxmox-homelab-toolkit
