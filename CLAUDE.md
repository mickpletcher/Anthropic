# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Location

Skills repo: `Documents\GitHub\Anthropic\`

This is a collection of Claude AI skill definitions. Each skill is a standalone folder with a consistent structure.

## Skill Structure

Every skill folder contains:
- `SKILL.md` — the skill definition loaded into the Claude platform. Has a YAML frontmatter block with `name` and `description`, followed by Markdown instructions.
- `PackSkill.ps1` — PowerShell script that zips `SKILL.md` plus any locally referenced assets into `skill.zip`. Run it from inside the skill folder or pass `-SkillDir` to point elsewhere.
- `README.md` — usage documentation for humans.
- `skill.zip` — the distributable, produced by `PackSkill.ps1`.

## Packaging a Skill

Run from within the skill directory:

```powershell
.\PackSkill.ps1
```

Or from anywhere:

```powershell
.\PackSkill.ps1 -SkillDir "Documents\GitHub\Anthropic\Facebook Post"
```

The script reads `SKILL.md`, finds any locally referenced files (images, linked docs), copies everything into a temp staging folder, then zips it to `skill.zip`. External URLs and anchor links are skipped automatically.

## Skill Frontmatter Format

```markdown
---
name: skill-name
description: Trigger conditions and what the skill does. This is what the Claude platform uses to decide when to activate the skill.
---
```

The `description` field controls activation. It should explicitly list the trigger shortcuts (e.g., "Always trigger immediately when the user's message starts with 'fbp'") plus any natural-language trigger conditions.

## Skill Triggers (Current Skills)

| Shortcut | Skill | Description |
|---|---|---|
| `fbp` | facebook-post | Write/polish Facebook posts |
| `fbr` | facebook-reply | Write replies to Facebook comments |
| `fit` / `workout` | fitness-log | Log workouts, track PRs, generate posts |
| `xp` | x-post | Write X (Twitter) posts, 280 char limit |
| `xr` | x-reply | Write replies to X posts |
| `rp` | photo-rename | Rename photos using vision + GPS + web search |
| (keyword) | container-home | Container build Q&A, planning, Facebook posts |

## Voice Rules Applied Across All Skills

These rules appear in every content-generating skill and must be consistent:

- No emojis
- No hyphens or em dashes (`-` or `—`). Rewrite the sentence.
- No quotation marks around words or phrases
- No AI-sounding language: "journey", "transformative", "game-changer", "leverage", "showcase", "utilize", "diving deep", "I'm excited to share", "The takeaway here is..."
- No motivational sign-offs or wrap-up conclusions
- First person, direct, conversational, short sentences
- Lead with the specific concrete detail, not a setup sentence
- Facebook: 2 to 3 hashtags. X: 2 to 3 hashtags, 280 character hard limit.

When editing a skill, check that any new instruction doesn't contradict these rules.

## Adding a New Skill

1. Create a new folder under `Documents\GitHub\Anthropic\`
2. Create `SKILL.md` with frontmatter and instructions
3. Copy `PackSkill.ps1` from an existing skill (they're all identical)
4. Run `PackSkill.ps1` to generate `skill.zip`
5. Write a `README.md`
