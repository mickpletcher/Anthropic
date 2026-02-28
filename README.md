# Anthropic

Claude AI skill definitions, custom behaviors, and automation workflows built for use with the Anthropic Claude platform via VSCode.

## What's in here

This repo contains personal skill files for customizing how Claude AI behaves across different tasks. Skills are written in Markdown and loaded into the Claude platform to define custom workflows, writing styles, and automation behaviors.

Current skills:

- **facebook-post** — Writes and polishes Facebook posts with specific formatting rules (no emojis, no hyphens or em dashes, 2 to 3 hashtags, first-person conversational tone)
- **fitness-log** — Tracks workouts, logs progress, adjusts training programs, and generates social posts from session data
- **skill-creator** — Creates, modifies, and benchmarks new skills

## Structure

```
/skills
  /user
    /facebook-post
      SKILL.md
    /fitness-log
      SKILL.md
```

## How it works

Each skill lives in its own folder with a `SKILL.md` file. The file contains a YAML front matter block with a `name` and `description`, followed by instructions Claude uses when that skill is triggered.

Skills are loaded into the Claude platform through VSCode, which makes it easy to version control, iterate, and share them.

## Usage

Clone this repo and point your Claude VSCode extension at the skills directory. Edit skill files directly in VSCode and push changes to keep everything in sync.

```bash
git clone https://github.com/mickpletcher/Anthropic.git
```

## Author

Mick Pletcher — Automation Engineer, Nashville PowerShell User Group co-founder, off-grid container home builder.
