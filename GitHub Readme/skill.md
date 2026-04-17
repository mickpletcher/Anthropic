---
name: github-readme
description: Generate polished GitHub README.md files for Mick's repositories in his established voice and structure. Always trigger immediately when the user's message starts with "readme" or "gr". Also trigger on "write a readme", "generate readme", "readme for this repo", "document this repo", or any request to create or rewrite a GitHub README. Produces a complete, ready-to-paste README.md file with the correct section set for the repo type — never a generic template, always tailored to the actual project.
---

# GitHub README Skill

Write polished, complete README.md files for Mick's GitHub repositories (mickpletcher). Matches the voice, structure, and section choices established across his existing repos.

## Primary Triggers

**`readme`** or **`gr`** — Provide repo details after the trigger and the README is produced immediately.

Other triggers: "write a readme", "generate readme", "readme for this repo", "document this repo", "rewrite my readme"

```
readme [paste repo description, file list, or context]
gr [GitHub URL or repo name + description]
```

---

## Step 1 — Identify Repo Type

The section set depends on repo type. Determine which category applies before writing anything:

| Type | Examples | Key Sections |
|---|---|---|
| **Skills / Config library** | Anthropic, PiHole blocklists | Overview, Skills/Contents table, Install, Repo structure, Related repos |
| **Code toolkit / multi-module** | AlpacaTrading, SafeSend | Overview, What it does, Feature table, Repo structure, Setup, Env vars, Usage per module, Errors, License |
| **Single script / utility** | PowerShell automation scripts | Overview, What it does, Prerequisites, Usage, Parameters, Examples, License |
| **MCP server** | homeassistant-mcp, pihole-mcp | Overview, What it does, Tools table, Install + config, Usage, Proxmox/LXC notes if relevant, License |
| **API integration / webhook** | SafeSend webhooks | Overview, What it does, Endpoint table, Auth, Payload schemas, Setup, Examples, License |

If the repo doesn't fit neatly, pick the closest type and drop irrelevant sections.

---

## Step 2 — Extract Source Material

Pull from whatever the user provides. In priority order:

1. Folder/file tree (paste or described)
2. GitHub URL (fetch if available)
3. Existing README to rewrite
4. Description + context from the conversation

Extract: repo purpose, language(s), modules/scripts/folders, dependencies, trigger keywords, who it's for, any setup steps.

If a GitHub URL is provided, fetch it before writing.

---

## Step 3 — Write the README

### Universal Rules (apply to every README)

- **No emojis** anywhere in the document
- **No hyphens or em dashes** — rewrite sentences to avoid them
- **No marketing language** — no "powerful", "robust", "seamless", "cutting-edge", "game-changing", "leverages", "revolutionary"
- **No motivational sign-offs** — no "happy coding", "enjoy!", "feel free to..."
- **Plain prose for descriptions** — short sentences, active voice, practitioner tone
- **Tables for structured data** — modules, features, env vars, errors, parameters
- **Code blocks for everything runnable** — commands, paths, config snippets, example outputs
- **MIT License section** at the bottom of every README
- **Repo structure as annotated tree** for any repo with more than 3 files

---

### Section Definitions

Use these as building blocks. Pick the right set for the repo type (see Step 1). Never include a section with nothing to put in it.

---

#### `# [Repo Title]`
Bold noun phrase. Matches the repo name formatted for readability. No tagline in the H1.

Example: `# Alpaca Trading Toolkit` not `# AlpacaTrading - The Best Trading Bot!`

---

#### Repo description line (under H1)
One sentence in plain prose. What it is and what it does. No adjectives that don't add information.

Example: `Trading toolkit for Alpaca paper trading, strategy backtesting, automated signal execution, scheduling, and trade journaling.`

---

#### `## Overview`
2 to 4 sentences of plain prose. What the repo contains and what someone uses it for. No setup instructions here.

---

#### `## What This Does` (or `## What This Repository Does`)
Bulleted or prose explanation of the core functionality. Use for code toolkits. Skip for simple single-script repos where the overview covers it.

---

#### `## [Skill/Module/Tool] Table`
Use tables organized by category when the repo has multiple components. Each row: Name | Trigger or Purpose | Description. Match Mick's style from the Anthropic repo — three columns, category headers as H3 above each table.

Skills library example:
```markdown
| Skill | Trigger | Description |
|---|---|---|
| [skill-name](link) | `trigger` | What it does in one sentence |
```

Code toolkit example:
```markdown
| Module | Purpose | Typical User | Main Outputs |
|---|---|---|---|
| `src/` | PowerShell module suite for the Alpaca API | PowerShell engineers | account objects, order results |
```

MCP server example:
```markdown
| Tool | Description |
|---|---|
| `tool_name` | What the tool does |
```

---

#### `## Repository Structure`
Annotated file tree. Use `|--` formatting. Every file gets a short inline comment explaining what it is.

```
RepoName/
|-- README.md
|-- module/
|   |-- file.ps1    # What this file does
|   |-- file.py     # What this file does
```

For large repos (20+ files), group by folder and annotate folders rather than every individual file.

---

#### `## Prerequisites`
Bulleted list. Software versions, accounts, CLI tools required. No setup steps here — just what's needed before setup begins.

---

#### `## Installation` or `## Setup`
Numbered steps with code blocks. Exact commands. No vague instructions like "configure as needed."

For skills repos, include:
- Skills directory path
- Quick install script invocation
- Manual install path

For code repos, include:
- Clone
- Virtual environment or module setup
- Dependency install
- `.env` creation from `.env.example`

---

#### `## Environment Variables`
Table format: Variable | Required | Example | What It Controls

Only include this section if the repo uses a `.env` file or environment-based config.

---

#### `## Usage`
Per-module or per-script usage with exact commands and expected output. For toolkits, one subsection per major module. Lead each subsection with the simplest, safest command first.

---

#### `## Common Errors`
Table: Problem | Likely Cause | Fix

Include only for repos that have non-obvious failure modes. Always include for anything using API keys, virtual environments, or Windows execution policy.

---

#### `## Security Notes`
Short bulleted list. Include for any repo that handles API keys, credentials, or sensitive data.
- Never ends with "stay safe!" or similar
- Direct and factual, not scary

---

#### `## Related Repositories`
Table: Repo | Description

Link to related Mick repos when relevant. Use exact repo names.

Known repos to cross-reference:
- `mickpletcher/Alpaca` or `mickpletcher/AlpacaTrading` — algorithmic trading stack
- `mickpletcher/Anthropic` — Claude skills library
- `mickpletcher/PiHole` — Pi-hole blocklist repository
- `mickpletcher/homeassistant-mcp` — Home Assistant MCP server

---

#### `## Blog`
Single line: `Technical posts about [topic] at [mickitblog.blogspot.com](https://mickitblog.blogspot.com).`

Include this section on any public-facing repo.

---

#### `## License`
Always last. Always MIT.

```markdown
## License

This project is licensed under the MIT License. See `LICENSE` for the full text.
```

---

## Voice and Tone Reference

Mick's README voice is the same as his blog and social posts — direct, technical, practitioner-focused. No fluff.

**What it sounds like:**

"This project gives you a step by step workflow for learning systematic trading with Alpaca."

"Beginner friendly trading tools for learning strategy testing, paper trading, scheduling, and trade review without risking real money."

"Skills are organized around three areas: content creation, technical automation, and infrastructure and project work."

**What it does not sound like:**

"This powerful, cutting-edge toolkit leverages the Alpaca API to supercharge your trading workflow!"

"Feel free to explore the modules and happy coding!"

**Anti-patterns to eliminate before finalizing:**
- Any sentence that could appear in a marketing brochure
- Phrases like "easy to use", "out of the box", "just works", "battle tested"
- Passive voice where active is cleaner
- Redundant section intros like "In this section, we will cover..."

---

## Output

Produce the complete README.md as a downloadable file:

1. Write to `/mnt/user-data/outputs/README.md`
2. Use `present_files` to deliver it
3. Confirm: repo name, type identified, sections included

Do not present the README as inline chat text. Always write it to a file.

---

## Known Repos — Pre-loaded Context

Use this when Mick references a repo by name without providing full context:

| Repo | Type | Primary Language | Notes |
|---|---|---|---|
| Anthropic | Skills library | PowerShell | Claude skill definitions and automation workflows |
| AlpacaTrading | Code toolkit | Python + PowerShell | Alpaca paper trading, backtesting, journaling |
| PiHole | Config/blocklist | Text | Curated Pi-hole blocklist sources, 57+ entries |
| homeassistant-mcp | MCP server | Python | Home Assistant MCP server, Pleasant View instance |
| SafeSend | API integration | Python + PowerShell | SafeSend webhook receiver and integration framework |
