---
name: x-post
description: Write posts for X (formerly Twitter) on tech, PowerShell, IT automation, and fitness topics. Always trigger immediately when the user's message starts with "xp". Produce a single post within 280 characters, no emojis, no hyphens or em dashes, 2 to 3 hashtags maximum.
---

# X Post Skill

Write posts for X on tech, PowerShell, IT automation, and fitness. Same voice as Mick's Facebook posts — direct, specific, no fluff — but tighter. Every post must fit in a single 280 character post including hashtags.

## Trigger

Activated when the message starts with `xp`. Everything after it is the draft or topic. Rewrite it into a polished X post immediately. No clarifying questions first. Produce the post, show the character count, then ask if anything needs adjusting.

```
xp just automated Intune compliance reporting, cut a 2 hour manual process down to 3 minutes
xp hit 790 on leg press today, started at 465 three months ago
```

## Non-Negotiable Rules

- No emojis
- No hyphens or em dashes — rewrite the sentence to avoid them entirely
- No quotation marks around words or phrases
- Single post only — must fit within 280 characters including hashtags
- 2 to 3 hashtags maximum, placed at the end
- First person, confident and conversational
- Always show the character count after the post

## Character Budget

280 characters total. Hashtags eat into that budget. Plan accordingly.

- 2 hashtags average 20 to 30 characters
- Leave at least 250 characters for the post body before adding hashtags
- If the draft is too long, cut adjectives first, then restructure, never truncate mid-thought

Always show the count in this format after the post:
`[X / 280 characters]`

If the post is over 280, flag it and offer a tighter version automatically. Do not ask — just provide the fix.

## Voice and Tone

X rewards punchy, opinionated, specific posts. Same voice rules as fbp — direct, no fluff, short sentences — but even more compressed. Every word has to earn its place.

Lead with the most interesting or specific detail. Not a setup, not context, not a warm-up. The first few words are the hook.

Banned phrases: "journey", "transformative", "game-changer", "next level", "cutting-edge", "excited to share", "proud to announce", "diving deep", "leverage", "showcase", "utilize", "The takeaway here is..."

### What works on X

- Specific numbers over vague claims: "790 lbs leg press" beats "hit a big PR today"
- Opinions stated plainly: "PowerShell is still the right tool for enterprise endpoint management"
- Process details that show you know what you are doing: "48V lithium system, sized to actual load calculations"
- Contrast or before/after: "0 pull-ups to 8 in 3 months"

### What does not work on X

- Anything that sounds like a LinkedIn post
- Motivational sign-offs
- Vague humble brags without specifics
- Asking people to like or retweet

## Hashtag Strategy

X algorithm uses hashtags differently than Facebook but the same principle applies: fewer, more relevant hashtags outperform tag spam.

Always use 2 to 3 hashtags. Place them at the end of the post on the same line or a new line depending on character budget.

### Hashtag Selection by Topic

**Tech / PowerShell / IT**: #PowerShell #ITAutomation #Intune #Azure #SCCM #EndpointManagement #Microsoft #SysAdmin

**Fitness**: #StrengthTraining #MuscleBuilding #FitnessProgress #Lifting #NaturalStrength

For any topic not listed, pick 2 to 3 hashtags that are specific to the actual subject and used by real communities on X.

## Post Structure

```
[Hook — the most specific or interesting detail first]
[One supporting sentence if character budget allows]
#Hashtag1 #Hashtag2
```

Most posts will be one or two tight sentences plus hashtags. Do not pad.

## Examples

**Tech**
Draft: "just automated Intune compliance reporting, cut a 2 hour manual process down to 3 minutes"
Post: "Automated Intune compliance reporting across 4,000 endpoints. 2-hour manual process is now a scheduled job that runs in 3 minutes. #PowerShell #ITAutomation"

Wait — that uses a hyphen. Corrected:
Post: "Automated Intune compliance reporting across 4,000 endpoints. What took 2 hours manually now runs as a scheduled job in 3 minutes. #PowerShell #ITAutomation"

**Fitness**
Draft: "hit 790 on leg press today, started at 465 three months ago"
Post: "790 lbs on leg press today. Started at 465 three months ago. 75% improvement and still climbing. #StrengthTraining #MuscleBuilding"

**Bad**
"So excited to share that I've been absolutely crushing my fitness goals lately! This journey has been so rewarding! #FitnessJourney #Blessed"

## Output Format

Output the post text only, ready to paste into X. Show the character count on the line below. Then ask if anything needs adjusting.
