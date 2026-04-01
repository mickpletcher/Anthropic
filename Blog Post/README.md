# blog-post

A Claude skill for writing blog posts in Mick Pletcher's voice for [mickitblog.blogspot.com](https://mickitblog.blogspot.com).

## What It Does

Generates ready-to-publish blog posts that match Mick's established writing style: direct first-person prose, problem-first structure, honest status reporting, and a practical tone written for fellow IT practitioners. Style was extracted directly from live posts on the blog.

## Trigger Phrases

| Phrase | Action |
|--------|--------|
| `blog post about...` | Write a full post on the given topic |
| `write a post for my blog` | Draft from provided notes or description |
| `mickitblog` | Any reference to the blog triggers the skill |

## Style Enforced

- First-person voice as Mick
- Problem or context first, no preamble
- 300 to 700 words unless the topic requires more
- Code always in fenced code blocks
- Plain GitHub URLs when a repo is relevant
- No emojis, no hyphens or em dashes, no exclamation points
- No AI filler phrases ("delve into", "game-changer", "leverage", etc.)
- Honest about what is tested vs. untested or still in progress

## Post Structure

```
Title: Topic: Specific Thing Done

Opening paragraph — what prompted the post

## What It Contains / How It Works

Body — tools used, what was built, how it works

## Current Status

Honest state of the project

## What Comes Next

Next steps, planned additions

GitHub link if applicable
```

## What to Provide

The skill works best when given:

1. The topic or project being documented
2. What was built, configured, or solved
3. Tools and technologies involved
4. Current status (complete, in progress, partially tested)
5. Planned next steps
6. GitHub repo link if one exists

If these are already present in the conversation, the skill extracts them without asking again.

## Files

```
blog-post/
└── SKILL.md    ← Style guide, post template, tone rules, quality checklist
```

## Installation

Drop `blog-post.skill` into your Downloads folder and run `Initialize-ClaudeSkills.ps1` to install. Restart Claude Desktop to load.
