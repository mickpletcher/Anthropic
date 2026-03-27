# mickpletcher/Anthropic

Claude AI skill definitions, custom behaviors, and automation workflows built for use with the Anthropic Claude platform via VS Code.

## Overview

This repository contains a personal library of Claude skills — structured instruction sets that teach Claude how to behave in specific contexts. Each skill is a `.skill` file (zip archive) containing a `SKILL.md` definition and optional reference files. Skills are installed into Claude Desktop and activate automatically when the right context is detected.

Skills are organized around three areas: **content creation**, **technical automation**, and **infrastructure and project work**.

---

## Skills

### Content Creation

| Skill | Trigger | Description |
|-------|---------|-------------|
| [blog-post](./skills/blog-post/) | `blog post about...` | Writes posts for mickitblog.blogspot.com in Mick's exact voice — direct, first-person, problem-first, practitioner-focused |
| [linkedin-post](./skills/linkedin-post/) | `linkedin post about...` | Writes professional LinkedIn posts for IT, AI, and automation audiences — polished but never corporate |
| [facebook-post](./skills/facebook-post/) | `fbp` | Writes Facebook posts — casual, first-person, no emojis, 2 to 3 hashtags |
| [facebook-reply](./skills/facebook-reply/) | `fbr` | Writes replies to Facebook comments on existing posts |
| [x-post](./skills/x-post/) | `xp` | Writes X posts under 280 characters — no emojis, no em dashes, 2 to 3 hashtags |
| [x-reply](./skills/x-reply/) | `xr` | Writes replies to X threads |
| [website-content](./skills/website-content/) | Context-based | Writes and updates personal website copy across all sections — bio, projects, skills, AI showcase, health/sports, SEO |

### Technical Automation

| Skill | Trigger | Description |
|-------|---------|-------------|
| [powershell-automation](./skills/powershell-automation/) | Context-based | Writes enterprise PowerShell scripts for SCCM, Intune, Azure AD, and Active Directory — enforces Mick's header format, CMTrace logging, strict error handling, and parameter validation |
| [alpaca-trading](./skills/alpaca-trading/) | Context-based | Builds and extends algorithmic trading scripts against the Alpaca API — PowerShell-first, five-module repo structure, mandatory live trading guards |
| [n8n-workflow](./skills/n8n-workflow/) | Context-based | Designs n8n automation workflows — pre-loaded with Mick's Proxmox instance, Claude API node config, and Cloudflare Tunnel patterns |
| [mcp-builder](./skills/mcp-builder/) | Context-based | Builds MCP (Model Context Protocol) servers — Python/FastMCP primary, includes Proxmox deployment, Cloudflare Tunnel config, and PowerShell client patterns |

### Infrastructure & Project Work

| Skill | Trigger | Description |
|-------|---------|-------------|
| [proxmox-lxc](./skills/proxmox-lxc/) | Context-based | Generates full LXC container deployment stacks from a service name and IP — pct create, systemd unit file, Cloudflare Tunnel config entry |
| [container-home](./skills/container-home/) | Context-based | Generates Obsidian-formatted documentation for the off-grid container home build in Stewart County, TN — structural, solar, welding, plumbing, and work session logs |

### Fitness & Tracking

| Skill | Trigger | Description |
|-------|---------|-------------|
| [fitness-log](./skills/fitness-log/) | `fit` or `workout` | Logs workout sessions, tracks PRs, and generates Facebook posts from training data |
| [obsidian-workout-export](./skills/obsidian-workout-export/) | `owd` | Exports workout data to Obsidian-formatted Markdown |

---

## Installation

### Prerequisites

- [Claude Desktop](https://claude.ai/download) installed
- Skills directory created at `C:\Users\{username}\OneDrive\Documents\Claude\Skills\`

### Quick Install

1. Download the `.skill` files from this repo
2. Place them in your Downloads folder
3. Run the install script:

```powershell
powershell.exe -ExecutionPolicy Bypass -File Initialize-ClaudeSkills.ps1
```

The script creates the Skills directory structure, extracts all `.skill` files found in Downloads, and reports what was installed. Restart Claude Desktop after running.

### Manual Install

Each `.skill` file is a zip archive. Extract the contents into:

```
C:\Users\{username}\OneDrive\Documents\Claude\Skills\user\{skill-name}\
```

Restart Claude Desktop to load.

---

## Repository Structure

```
Anthropic/
├── README.md
├── Initialize-ClaudeSkills.ps1     ← Install script
└── skills/
    ├── alpaca-trading/
    │   ├── SKILL.md
    │   └── README.md
    ├── blog-post/
    │   ├── SKILL.md
    │   └── README.md
    ├── container-home/
    │   ├── SKILL.md
    │   └── README.md
    ├── linkedin-post/
    │   ├── SKILL.md
    │   └── README.md
    ├── mcp-builder/
    │   ├── SKILL.md
    │   ├── README.md
    │   └── reference/
    ├── n8n-workflow/
    │   ├── SKILL.md
    │   └── README.md
    ├── powershell-automation/
    │   ├── SKILL.md
    │   ├── README.md
    │   └── reference/
    ├── proxmox-lxc/
    │   ├── SKILL.md
    │   └── README.md
    └── website-content/
        ├── SKILL.md
        ├── README.md
        └── reference/
```

---

## Related Repositories

| Repo | Description |
|------|-------------|
| [mickpletcher/Alpaca](https://github.com/mickpletcher/Alpaca) | Algorithmic trading stack — backtesting, paper trading, live trading, trade journal, AI coaching |
| [mickpletcher/SafeSend](https://github.com/mickpletcher/SafeSend) | SafeSend API and webhook integration framework |

---

## Blog

Technical posts about automation, enterprise IT, and AI infrastructure at [mickitblog.blogspot.com](https://mickitblog.blogspot.com).
