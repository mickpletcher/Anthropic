# Anthropic

Claude AI skill definitions, custom behaviors, and automation workflows built for use with the Anthropic Claude platform.

## What's in here

This repo contains personal skill files for customizing how Claude behaves across different tasks. Skills are written in Markdown and loaded into the Claude platform to define custom workflows, writing styles, and automation behaviors.

## Projects

### [ContainerUpgrade](./ContainerUpgrade)
A Claude skill loaded with full project context for Mick's off-grid shipping container lake home at Land Between the Lakes, Dover, Tennessee. Answers design and construction questions, assists with expansion planning and phase sequencing, helps navigate septic permitting, and generates Facebook posts about the build in Mick's voice.

### [Facebook Post](./Facebook%20Post)
A Claude skill for writing and polishing Facebook posts. Triggered by typing `fbp` followed by a draft or topic. Produces direct, first-person posts with no emojis, no hyphens or em dashes, and 2 to 3 hashtags. Output is ready to copy and paste directly into Facebook.

### [Facebook Reply](./Facebook%20Reply)
A Claude skill for writing replies to Facebook comments. Triggered by typing `fbr` followed by the comment being responded to. Tone adjusts automatically based on whether the comment is supportive, a question, or pushback. Output is the reply text only, ready to paste directly into Facebook.

### [Fitness](./Fitness)
A Claude skill for tracking workouts, logging fitness progress, and generating Facebook posts from session data. Triggered by typing `fit` or `workout`. Handles workout logging, PR tracking, program adjustments, and progress summaries against baseline numbers.

### [Rename Pictures](./Rename%20Pictures)
A Claude skill that renames photos to descriptive real-world names using AI vision, GPS metadata, and web search. Triggered by typing `rp` with attached photos. Converts generic filenames like `IMG_4821.jpg` into descriptive names like `phantom_ranch_grand_canyon.jpg` using a multi-layered identification approach.

### [X Post](./X%20Post)
A Claude skill for writing posts for X (formerly Twitter) on tech, PowerShell, IT automation, and fitness topics. Triggered by typing `xp` followed by a draft or topic. Produces a single post within 280 characters with a character count shown, 2 to 3 hashtags, and no emojis or em dashes.

### [X Reply](./X%20Reply)
A Claude skill for writing replies to replies on X. Triggered by typing `xr` followed by the reply being responded to. Tone adjusts automatically based on whether the reply is supportive, a question, skeptical, or bad faith. Every response fits within 280 characters.

## Structure

Each project lives in its own folder containing a `SKILL.md` file with the skill instructions, a `README.md` with usage documentation, a `PackSkill.ps1` script to package the skill, and a `skill.zip` distributable where applicable.

## How it works

Each skill lives in its own folder with a `SKILL.md` file. The file contains a `name` and `description` followed by instructions Claude uses when that skill is triggered. Skills are loaded into the Claude platform, which makes it easy to version control, iterate, and share them.

## Usage

```bash
git clone https://github.com/mickpletcher/Anthropic.git
```

## Author

Mick Pletcher — Automation Engineer, Nashville PowerShell User Group co-founder, off-grid container home builder.
