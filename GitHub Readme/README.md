# github-readme

A Claude skill for generating polished, complete README.md files for Mick's GitHub repositories in his established voice and structure.

## Trigger

Start any message with `readme` or `gr` to activate this skill immediately. It also triggers on natural language requests to write or rewrite a README.

```text
readme [paste repo description, file list, or context]
gr [GitHub URL or repo name + description]
write a readme
generate readme
readme for this repo
document this repo
rewrite my readme
```

## What It Does

Reads whatever you provide about the repo and produces a complete, ready-to-paste README.md. The output is tailored to the actual project, not a generic template.

### Identify the repo type

Determines section structure based on what kind of repo it is:

| Type | Examples |
| --- | --- |
| Skills or config library | Anthropic, PiHole blocklists |
| Code toolkit or multi-module | AlpacaTrading, SafeSend |
| Single script or utility | PowerShell automation scripts |
| MCP server | homeassistant-mcp, pihole-mcp |
| API integration or webhook | SafeSend webhooks |

### Extract source material

Pulls from repo file trees, GitHub URLs, existing READMEs, or descriptions provided in the conversation. Fetches GitHub URLs when provided.

### Write the README

Produces the correct section set for the repo type. Sections used include: Overview, skills or module table, repo structure, prerequisites, installation, environment variables, usage, common errors, security notes, related repositories, and MIT license.

## Style Rules

- No emojis
- No hyphens or em dashes
- No marketing language: "powerful", "robust", "seamless", "cutting-edge", "game-changing", "leverages"
- No motivational sign-offs
- Short sentences, active voice, practitioner tone
- Tables for structured data
- Code blocks for everything runnable
- MIT License section in every README
- Annotated file tree for any repo with more than 3 files

## File Structure

```text
GitHub Readme/
├── README.md
└── skill.md
```
