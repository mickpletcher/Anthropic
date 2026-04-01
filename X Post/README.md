# x-post

A Claude AI skill for writing posts for X (formerly Twitter) on tech, PowerShell, IT automation, and fitness. Triggered by typing `xp` followed by a draft or topic. Always produces a single post within 280 characters with a character count shown.

## Trigger

Start any message with `xp` to activate this skill. Everything after it is treated as your draft and immediately rewritten into a polished X post.

```
xp just automated Intune compliance reporting, cut a 2 hour manual process down to 3 minutes
xp hit 790 on leg press today, started at 465 three months ago
xp built the container home frame for the second addition this weekend
```

Output is the post text ready to paste into X, with character count shown below it.

## What it does

Reads the draft, rewrites it into a tight single post within 280 characters, adds 2 to 3 relevant hashtags, shows the character count, and asks if anything needs adjusting. No clarifying questions asked first.

If the post runs over 280 characters, it flags it and automatically provides a tighter version without being asked.

## Rules

- No emojis
- No hyphens or em dashes — sentences rewritten to avoid them entirely
- No quotation marks around words or phrases
- Single post only, 280 characters maximum including hashtags
- 2 to 3 hashtags placed at the end
- Character count shown after every post in `[X / 280 characters]` format
- Never sounds like a LinkedIn post

## Topics

| Topic | Hashtag pool |
|---|---|
| Tech / PowerShell / IT | #PowerShell #ITAutomation #Intune #Azure #SCCM #EndpointManagement #Microsoft #SysAdmin |
| Fitness | #StrengthTraining #MuscleBuilding #FitnessProgress #Lifting #NaturalStrength |

## What works on X

- Specific numbers over vague claims: "790 lbs leg press" beats "hit a big PR"
- Opinions stated plainly without hedging
- Before/after contrast: "0 pull-ups to 8 in 3 months"
- Process details that show expertise

## Examples

**Tech**

Draft: "just automated Intune compliance reporting, cut a 2 hour manual process down to 3 minutes"

Post:
```
Automated Intune compliance reporting across 4,000 endpoints. What took 2 hours manually now runs as a scheduled job in 3 minutes. #PowerShell #ITAutomation
```
`[154 / 280 characters]`

---

**Fitness**

Draft: "hit 790 on leg press today, started at 465 three months ago"

Post:
```
790 lbs on leg press today. Started at 465 three months ago. 75% improvement and still climbing. #StrengthTraining #MuscleBuilding
```
`[131 / 280 characters]`

---

**Bad example**

"So excited to share that I've been absolutely crushing my fitness goals lately! This journey has been so rewarding! #FitnessJourney #Blessed"

## Banned Phrases

"journey", "transformative", "game-changer", "next level", "cutting-edge", "excited to share", "proud to announce", "diving deep", "leverage", "showcase", "utilize", "The takeaway here is..."

## Related Skills

- [facebook-post](../Facebook%20Post/README.md) — Write Facebook posts using the `fbp` trigger
- [facebook-reply](../Facebook%20Reply/README.md) — Write Facebook comment replies using the `fbr` trigger
