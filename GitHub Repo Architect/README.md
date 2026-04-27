# github-repo-architect

A Claude skill for turning a rough project idea into a complete GitHub repository architecture.

## Trigger

Start any message with `repo`, `gra`, or `architect repo` to activate this skill immediately. It also triggers on natural language requests to design or scaffold a GitHub repository.

```text
repo [project idea, target language, or rough requirements]
gra [GitHub repo concept]
architect repo [existing notes or spec]
build a repo structure
design a GitHub repo
scaffold this repository
create repository architecture
turn this idea into a repo
```

## What It Does

Converts a project idea into a repository blueprint that can be implemented directly.

It produces:

- Repository name and purpose
- Assumptions
- Folder layout
- Generated file list
- README.md
- Development prompts
- GitHub Actions CI pipeline
- Setup commands
- Next implementation tasks

## Project Types

The skill adapts the structure based on the repo type.

| Type | Examples |
| --- | --- |
| Claude or Codex skill | Content writer, automation helper |
| CLI tool | PowerShell module, Python utility, Node script |
| API service | FastAPI, Express, Flask, webhook receiver |
| Web app | React, Next.js, static dashboard |
| MCP server | Home Assistant MCP, Pi-hole MCP |
| Automation repo | Playwright scraper, scheduled task, n8n helper |
| Data project | ETL, analysis notebook, report generator |
| Infrastructure repo | Docker, Proxmox, Terraform, Ansible |

## Output Style

- Practical repository structure
- Exact file paths
- Annotated folder tree
- Stack appropriate CI workflow
- README sections matched to the project
- Prompts tailored to the generated repo
- Security notes when secrets, credentials, personal data, trading data, scraping, or automation are involved

## File Structure

```text
GitHub Repo Architect/
├── README.md
├── skill.md
└── skill.zip
```
