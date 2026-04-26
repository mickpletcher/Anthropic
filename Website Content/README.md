# website-content

A Claude skill for writing and updating content for Mick Pletcher's personal website.

## What It Does

Generates polished, first-person web copy across every section of the site. Pre-loaded with Mick's actual background, projects, and bio details so nothing needs to be re-explained. Tone sits between the blog (direct, technical) and LinkedIn (professional, refined) — personal but never casual, specific but never a resume dump.

## Trigger Phrases

Triggered by context rather than a shortcut keyword. Activates when Mick asks to write or update any of the following:

| Request | Output |
|---------|--------|
| `write my about section` | Short or long bio block |
| `project writeup for [X]` | Three-paragraph project description |
| `landing page copy` | Hero section options |
| `skills section` | Technical competencies and career highlights |
| `AI homelab section` | Proxmox / n8n / MCP infrastructure description |
| `health and sports section` | Athletic background and current training |
| `blog integration copy` | mickitblog summary and link block |
| `contact section` | Professional contact copy |
| `SEO description` | Meta description, page title, Open Graph text |

## Tone

Polished and professional — closer to LinkedIn than the blog. First-person throughout. Specific details over vague claims. No corporate speak, no filler phrases, no emojis, no hyphens or em dashes.

## Pre-loaded Content

The skill knows:

- Professional role, employer, and specializations
- Nashville PowerShell User Group co-founder
- Microsoft MVP Alumni
- mickitblog.blogspot.com — 1M+ readers
- Container home build: Stewart County TN, two 40-ft high cube containers, 15kW solar target, solo build with welding
- Alpaca trading stack: PowerShell + Python, five modules, Claude as reasoning layer
- Proxmox homelab: n8n, local LLMs, MCP servers, Cloudflare Tunnel
- Athletic background: triathlons, cycling, Kilimanjaro summit, current 4-day training split
- 33 countries visited, targeting 50

## Featured Projects

- Container home build
- Alpaca trading stack
- Proxmox homelab / n8n

## Files

```
website-content/
├── SKILL.md                      ← Tone guide, section templates, SEO patterns, quality checklist
└── reference/
    └── copy-library.md           ← Ready-to-use copy blocks for every section
```

## Installation

Drop `website-content.skill` into your Downloads folder and run `Initialize-ClaudeSkills.ps1` to install. Restart Claude Desktop to load.
