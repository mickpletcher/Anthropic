# n8n-workflow

A Claude skill for designing, building, and troubleshooting n8n automation workflows on Mick's self-hosted Proxmox stack.

## What It Does

Generates complete n8n workflow designs including node configurations, Claude API integration patterns, webhook setups, error handling, and Cloudflare Tunnel config — pre-loaded with Mick's actual infrastructure details so nothing generic needs to be filled in.

## Trigger Phrases

| Phrase | Action |
|--------|--------|
| `n8n workflow for...` | Design a workflow for the described use case |
| `automate [X] in n8n` | Build a pipeline for the given task |
| `n8n node for...` | Generate a specific node configuration |
| `debug my n8n workflow` | Troubleshoot a described issue |

## Infrastructure Pre-loaded

- Instance: Proxmox LXC CT 104 at 192.168.0.81:5678
- External access: Cloudflare Tunnel
- Claude API: HTTP Request node config with correct headers and `content[0].text` extraction
- Known credentials: Anthropic, CoinGecko, Alpaca, Reddit, SMTP

## Covers

- Schedule, Webhook, and Manual trigger patterns
- Claude API integration via HTTP Request node
- RSS feed processing pipelines
- Error notification routing
- Credential store setup (never hardcoded keys)
- Morning briefing pipeline pattern (CoinGecko + RSS + Reddit → Claude → delivery)
- Cloudflare Tunnel config entries for external webhook exposure
- Proxmox LXC maintenance commands (status, logs, restart, update)

## Design Principles Enforced

- One trigger, one purpose per workflow
- Error handling on every external call
- All API keys in n8n credential store
- Set node used to normalize data between steps
- Static data pinning during development

## Files

```
n8n-workflow/
└── SKILL.md    ← Stack reference, node patterns, pipeline templates, credential table, checklist
```

## Installation

Drop `n8n-workflow.skill` into your Downloads folder and run `Initialize-ClaudeSkills.ps1` to install. Restart Claude Desktop to load.
