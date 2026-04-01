# proxmox-lxc

A Claude skill for deploying and configuring Proxmox LXC containers on Mick's self-hosted homelab stack.

## What It Does

Generates the complete deployment stack for a new LXC container from a single request. Provide a service name and IP address and get back all five components ready to run: the `pct create` command, initial container setup, application install and config, systemd unit file, and Cloudflare Tunnel config entry.

## Trigger Phrases

| Phrase | Action |
|--------|--------|
| `deploy [service] on Proxmox` | Full five-step deployment stack |
| `spin up a container for...` | New LXC with all configs |
| `add [service] to Cloudflare Tunnel` | Tunnel config entry only |
| `systemd service for...` | Unit file only |
| `set up static IP for...` | UniFi assignment steps |

## What Gets Generated

For each new service deployment the skill outputs all five of these:

1. `pct create` command with hostname, memory, cores, static IP, and gateway
2. Initial container setup (apt update, base packages, Python or Node install)
3. Application directory, package install, and `.env` file with `chmod 600`
4. Systemd unit file with `EnvironmentFile`, `Restart=always`, and journal logging
5. Cloudflare Tunnel `config.yml` ingress entry and restart command

## Infrastructure Pre-loaded

- Base template: Ubuntu 22.04 standard
- Gateway: 192.168.0.1
- DNS: 1.1.1.1
- Known containers: CT 104 = n8n at 192.168.0.81
- Network: UniFi static IP via MAC or `--net0` flag at creation
- Tunnel: Cloudflare, no port forwarding required

## Memory Sizing Reference

| Workload | RAM |
|----------|-----|
| MCP server, small API | 512MB |
| Python app, n8n-like | 1024MB |
| Database, ML workload | 2048MB+ |

## Also Covers

- UniFi static IP assignment steps
- Common service port reference (n8n, FastAPI, Home Assistant, Grafana, Ollama, Portainer)
- Snapshot and rollback before major changes
- Container maintenance commands (start, stop, restart, logs, status)

## Files

```
proxmox-lxc/
└── SKILL.md    ← Full deployment sequence, maintenance commands, port reference, checklist
```

## Installation

Drop `proxmox-lxc.skill` into your Downloads folder and run `Initialize-ClaudeSkills.ps1` to install. Restart Claude Desktop to load.
