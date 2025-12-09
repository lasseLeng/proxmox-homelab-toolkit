# Beispiel-Netzwerk-Setup

Ein typisches Homelab-Setup könnte so aussehen:

- `vmbr0` – Bridge für das Haupt-LAN (z. B. 192.168.10.0/24)
- `vmbr1` – Bridge für ein isoliertes Lab-Netz (z. B. 10.10.0.0/24)
- Optional VLAN-Tagging für verschiedene Segmente

Beispiel für `/etc/network/interfaces` (vereinfacht):

```bash
auto vmbr0
iface vmbr0 inet static
    address 192.168.10.10/24
    gateway 192.168.10.1
    bridge_ports eno1
    bridge_stp off
    bridge_fd 0

auto vmbr1
iface vmbr1 inet manual
    bridge_ports none
    bridge_stp off
    bridge_fd 0
