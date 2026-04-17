# mickpletcher/Anthropic

Claude AI skill definitions, custom behaviors, and automation workflows built for use with the Anthropic Claude platform via VS Code.

## Overview

This repository contains a personal library of Claude skills, structured instruction sets that teach Claude how to behave in specific contexts. The repo currently includes 21 skills. Most skill folders include a source definition file such as `skill.md` or `SKILL.md` plus `README.md`, and some also include a packaged `.skill` or `skill.zip` artifact. Skills are installed into Claude Desktop and activate automatically when the right context is detected.

All content in this repository is personal work. It is not sourced from, connected to, or representative of any employer systems, data, or internal processes.

Skills are organized around four areas: **content creation**, **technical automation**, **infrastructure and project work**, and **travel planning**.

---

## Skills

### Content Creation

| Skill | Trigger | Description |
| --- | --- | --- |
| [blog-post](./Blog%20Post/README.md) | `blog post about...` | Writes posts for mickitblog.blogspot.com in Mick's exact voice, direct, first-person, problem-first, practitioner-focused |
| [blog-to-social](./Blog%20To%20Social/README.md) | `bts` | Converts one finished blog post into ready-to-post Facebook, X, and LinkedIn versions in one pass |
| [github-readme](./GitHub%20Readme/README.md) | `readme` or `gr` | Generates polished, complete README.md files for GitHub repos, tailored by repo type with correct section set and voice |
| [linkedin-post](./LinkedIn%20Post/README.md) | `linkedin post about...` | Writes professional LinkedIn posts for IT, AI, and automation audiences, polished but never corporate |
| [facebook-post](./Facebook%20Post/README.md) | `fbp` | Writes Facebook posts, casual, first-person, no emojis, up to 6 relevant hashtags |
| [facebook-reply](./Facebook%20Reply/README.md) | `fbr` | Writes replies to Facebook comments on existing posts |
| [x-post](./X%20Post/README.md) | `xp` | Writes X posts under 280 characters, no emojis, no em dashes, 2 to 3 hashtags |
| [x-reply](./X%20Reply/README.md) | `xr` | Writes replies to X threads |
| [website-content](./Website%20Content/README.md) | Context-based | Writes and updates personal website copy across all sections, bio, projects, skills, AI showcase, health/sports, SEO |

### Technical Automation

| Skill | Trigger | Description |
| --- | --- | --- |
| [alpaca-trading](./Alpaca%20Trading/README.md) | Context-based | Builds and extends algorithmic trading scripts against the Alpaca API, PowerShell-first with mandatory live trading guards |
| [crypto-listings](./Cryptolistings/README.md) | `cl` | Retrieves recent and upcoming crypto listings with source backed exchange data, UTC windows, and structured market briefs |
| [n8n-workflow](./n8n%20Workflow/README.md) | Context-based | Designs n8n automation workflows with Proxmox, Claude API node config, and Cloudflare Tunnel patterns |
| [pihole](./PiHole/README.md) | Context-based | Provides Pi-hole setup and administration guidance |
| [pihole-blocklist](./PiHole%20Blocklist/README.md) | Context-based | Evaluates, categorizes, and documents new Pi-hole blocklist sources for the curated blocklist repository |
| [rename-pictures](./Rename%20Pictures/README.md) | `rp` | Renames photos using metadata, GPS context, and web lookup guidance |

### Infrastructure & Project Work

| Skill | Trigger | Description |
| --- | --- | --- |
| [proxmox-lxc](./Proxmox%20LXC/README.md) | Context-based | Generates full LXC container deployment stacks from a service name and IP, pct create, systemd unit file, Cloudflare Tunnel config entry |
| [container-home](./Container%20Upgrade/README.md) | Context-based | Generates Obsidian formatted documentation for the off-grid container home build in Stewart County, TN |

### Fitness & Tracking

| Skill | Trigger | Description |
| --- | --- | --- |
| [fitness-log](./fitness/README.md) | `fit` or `workout` | Logs workout sessions, tracks PRs, and generates Facebook posts from training data |
| [obsidian-workout-export](./Obsidian%20Workout%20Data/README.md) | `owd` | Exports workout data to Obsidian formatted Markdown |

### Travel Planning

| Skill | Trigger | Description |
| --- | --- | --- |
| [travel-planning](./TravelPlanning/README.md) | Context-based | Plans solo travel itineraries with personalized constraints, active trip references, routing, and budget guidance |
| [travel-itinerary](./Travel%20Itinerary/README.md) | `trip` or `itinerary` | Builds reusable Obsidian ready itinerary files with logistics, budget, packing list, and open items |

---

## Installation

### Prerequisites

- [Claude Desktop](https://claude.ai/download) installed
- Skills directory created at `C:\Users\{username}\OneDrive\Documents\Claude\Skills\`

### Quick Install

1. Download `.skill` files from this repo or package a folder first
2. Place them in your Downloads folder
3. Run the install script:

```powershell
powershell.exe -ExecutionPolicy Bypass -File ".\Initialize Claude Skills\Initialize-ClaudeSkills.ps1"
```

The script creates the Skills directory structure, extracts all `.skill` files found in Downloads, and reports what was installed. Restart Claude Desktop after running.

### Manual Install

Each `.skill` file is a zip archive. Extract the contents into:

```text
C:\Users\{username}\OneDrive\Documents\Claude\Skills\user\{skill-name}\
```

Restart Claude Desktop to load.

---

## Repository Structure

```text
Anthropic/
├── README.md
├── PackSkill.ps1
├── Initialize Claude Skills/
│   └── Initialize-ClaudeSkills.ps1
├── Alpaca Trading/
├── Blog Post/
├── Blog To Social/
├── Container Upgrade/
├── Cryptolistings/
├── Facebook Post/
├── Facebook Reply/
├── fitness/
├── GitHub Readme/
├── Home Assistant Automation/
├── LinkedIn Post/
├── n8n Workflow/
├── Obsidian Workout Data/
├── PiHole/
├── PiHole Blocklist/
├── Proxmox LXC/
├── Rename Pictures/
├── Travel Itinerary/
├── TravelPlanning/
├── Website Content/
├── X Post/
└── X Reply/
```

---

## Skill Folder Conventions

Use this contract for packaged skill folders in this repository.

Common files:

1. `README.md`
2. `skill.md` or `SKILL.md`

Output artifact:

1. `skill.zip`
2. Some legacy folders also include a packaged `.skill` file

Root packaging script:

1. `PackSkill.ps1`

Packaging commands:

```powershell
pwsh -NoProfile -File .\PackSkill.ps1 -All
```

```powershell
pwsh -NoProfile -File .\PackSkill.ps1 -SkillDir ".\PiHole"
```

```powershell
pwsh -NoProfile -File .\PackSkill.ps1 -All -WhatIf
```

```powershell
pwsh -NoProfile -File .\PackSkill.ps1 -SelfTest
```

Behavior notes:

1. If `-All` and `-SkillDir` are both omitted, the script defaults to packaging all skill folders under the current root recursively.
2. `-WhatIf` previews packaging actions and does not create `skill.zip` files.
3. `-SelfTest` runs path helper checks and exits.

Script help:

```powershell
Get-Help .\PackSkill.ps1 -Full
```

Validation commands:

```powershell
pwsh -NoProfile -File .\scripts\Validate-SkillFolders.ps1
```

```powershell
pwsh -NoProfile -File .\scripts\Validate-SkillFolders.ps1 -FailOnIssues -RepairHints
```

CI checks:

1. Skill folder validation workflow
2. Markdown link check workflow

Current notes:

1. The packaging script scans recursively for `skill.md` files, case insensitive, so both `skill.md` and `SKILL.md` are supported.
2. Some older folders still use a prebuilt `.skill` artifact in the repo alongside the folder README.

---

## Related Repositories

| Repo | Description |
| --- | --- |
| [mickpletcher/Alpaca](https://github.com/mickpletcher/Alpaca) | Algorithmic trading stack — backtesting, paper trading, live trading, trade journal, AI coaching |
| [mickpletcher/SafeSend](https://github.com/mickpletcher/SafeSend) | SafeSend API and webhook integration framework |

---

## Blog

Technical posts about automation, enterprise IT, and AI infrastructure at [mickitblog.blogspot.com](https://mickitblog.blogspot.com).
