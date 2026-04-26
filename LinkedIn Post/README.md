# linkedin-post

A Claude skill for writing LinkedIn posts in Mick Pletcher's professional voice.

## What It Does

Generates ready-to-post LinkedIn content calibrated for Mick's professional audience: IT peers, automation engineers, AI practitioners, and enterprise tech contacts. More polished than Facebook, less casual than X, but always first-person and direct. Never corporate speak.

## Trigger Phrases

| Phrase | Action |
|--------|--------|
| `lnp` | Immediate trigger, write post without asking |
| `linkedin post about...` | Write a post on the given topic |
| `write something for LinkedIn` | Draft from provided context |

## Content Pillars

1. **Home AI infrastructure** — Proxmox, n8n, local LLMs, MCP servers, Claude integrations
2. **Enterprise automation** — PowerShell, SCCM, Intune, Microsoft Graph
3. **Algorithmic trading** — Alpaca, Python/PowerShell trading stack
4. **Career and community** — Nashville PowerShell User Group, early retirement path, milestones
5. **Tech commentary** — GTC keynotes, model releases, tooling observations

## Post Structure

```
Hook line — what was built, solved, or learned. No preamble.

Body — 2 to 4 short paragraphs. Specific tools, numbers, outcomes.
One concrete detail beats three vague claims.

Optional closing — what comes next, or a brief observation.
Never a call to action.

#hashtag1 #hashtag2
```

## Format Rules

- No emojis
- No hyphens or em dashes
- No bullet points unless listing 3 or more discrete items
- 150 to 400 words
- Short paragraphs, 2 to 3 sentences each
- 2 to 3 hashtags at the bottom only
- No filler phrases or AI-sounding language

## Files

```
linkedin-post/
└── SKILL.md    ← Audience guide, post structure, format rules, example, quality checklist
```

## Installation

Drop `linkedin-post.skill` into your Downloads folder and run `Initialize-ClaudeSkills.ps1` to install. Restart Claude Desktop to load.
