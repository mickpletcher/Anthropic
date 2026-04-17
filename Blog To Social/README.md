# blog-to-social

A Claude AI skill for converting one finished blog post into three platform ready social posts in one pass: Facebook, X, and LinkedIn.

## Trigger

Start any message with `bts` to activate this skill immediately. It also triggers when you paste or link a blog post and ask Claude to share it, promote it, or turn it into social content.

```text
bts [paste blog post text here]
bts https://mickitblog.blogspot.com/...
blog to social
promote this post
social posts for this
```

## What it does

This skill reads the blog post once and produces all three social posts without back and forth.

### Extract the raw material

Pulls out the core point, key specifics, intended audience, and strongest hook before writing anything.

### Generate all three posts

Creates Facebook, X, and LinkedIn versions in that order. Each one is written natively for the platform instead of compressing the same copy three times.

### Keep the voice aligned

Uses the same tone rules as the related social skills. Direct, specific, first person where appropriate, and no AI sounding filler.

## Output Format

The response is delivered with clear copy and paste sections:

```text
## Facebook

[post text]

---

## X
[X / 280 characters]

[post text]

---

## LinkedIn

[post text]
```

After the three posts, the skill adds a one line note for anything that should be verified before posting, such as the blog URL.

## Platform Rules

| Platform | Rules |
| --- | --- |
| Facebook | Casual and direct, 1 to 2 short paragraphs, actual blog URL included, 6 relevant hashtags |
| X | 280 characters max including hashtags, strongest detail first, 2 to 3 hashtags, URL only if it fits |
| LinkedIn | 3 to 5 short paragraphs, hook first, then problem, approach, result, URL before hashtags |

## Voice Rules

- No emojis
- No hyphens or em dashes
- No quotation marks when avoidable
- Lead with specifics, not a vague setup sentence
- No corporate buzzwords or AI filler phrases
- Each post must stand on its own

## Content Rules

- Produce all three posts in one pass
- Do not ask which platform to start with
- Do not summarize the blog post into generic copy
- Lead with the most concrete result, number, tool, or takeaway from the post
- Do not reuse the same wording across Facebook, X, and LinkedIn
- Always include the actual blog URL in Facebook and LinkedIn

## LinkedIn Guidance

LinkedIn stays more structured than Facebook but still sounds like Mick. The post should follow a clear order:

1. Hook
2. Problem
3. Approach
4. Result
5. Call to read or a real question for comments

Avoid opening with `I` as the first word and avoid phrases like `excited to share`, `game-changer`, or `diving deep`.

## File Structure

```text
Blog To Social/
├── README.md
└── skill.md
```
