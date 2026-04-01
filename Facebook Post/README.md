# facebook-post

A Claude AI skill for writing and polishing Facebook posts. Triggered by typing `fbp` followed by a draft or topic.

## Trigger

Start any message with `fbp` to activate this skill. Everything after it is treated as your draft and immediately rewritten into a polished post. No clarifying questions asked first.

```text
fbp just hit 8 pull-ups today, started at zero three months ago
```

## What it does

1. Reads your draft and extracts every specific fact, number, and claim
2. Fact-checks anything verifiable against known context
3. Flags anything that seems off with a note after the post
4. Rewrites into polished post language without watering down the details
5. Adds up to 6 hashtags when possible based on topic
6. Optionally adds an engagement question at the end

Output is ready to copy and paste directly into Facebook.

## Rules

- No emojis
- No hyphens or em dashes — sentences are rewritten to avoid them entirely
- No quotation marks around words or phrases
- No bullet points or lists in the post body
- First person, confident and conversational tone
- Up to 6 hashtags when possible

## Hashtag Strategy

Facebook rewards relevant hashtags over random volume. This skill uses up to 6 when they are directly related to the post, usually one or two broader reach tags and the rest niche community tags.

| Topic | Hashtag pool |
| --- | --- |
| Tech / PowerShell / IT | #PowerShell #Intune #SCCM #Azure #AzureAD #ITAutomation #EndpointManagement #Microsoft |
| Fitness | #FitnessJourney #StrengthTraining #MuscleBuilding #Triathlon #Cycling #ActiveLifestyle |
| Container Home / Off-Grid | #ContainerHome #OffGrid #EarlyRetirement #SolarPower #GeographicArbitrage #StewartCountyTN |
| DIY / Welding / Fabrication | #DIY #Welding #MetalFabrication #MadeNotBought #DIYLife |
| Travel / Adventure | #WorldTravel #Adventure #BucketList #Kilimanjaro |

## Voice and Tone

Direct, casual, no fluff. Short sentences. Contractions. Lead with the actual point, not a warm-up. No motivational sign-offs or neat conclusions.

**Banned phrases**: "journey", "transformative", "game-changer", "next level", "cutting-edge", "I'm excited to share", "diving deep", "delve into", "leverage", "showcase", "utilize", "It's been an incredible...", "The takeaway here is..."

### Examples

| Draft | Output style |
| --- | --- |
| "Super excited to share this, been working really hard lately!" | "Eight pull-ups from zero in three months. The program is working." |
| "Just finished a PowerShell script that does some cool automation stuff." | "Finished a PowerShell module that automates Intune device compliance reporting across 4,000 endpoints. Went from a 2-hour manual process to a scheduled job that runs in under 3 minutes." |
| "The container home is coming along well, really happy with progress!" | "Welded the frame for the second container addition this weekend. Four containers will bring the total footprint to 1,280 square feet, enough to retire on permanently in Stewart County." |

## Post Structure

```text
[Lead with the actual point — no warm-up]

[1 to 2 short paragraphs with specific details]

[Optional: one open-ended question that invites a real response]

#Hashtag1 #Hashtag2 #Hashtag3 #Hashtag4 #Hashtag5 #Hashtag6
```

## Topic Guidance

- **Tech / IT**: What problem it solves, how it works, what the scale or impact is
- **Fitness**: Lead with the specific number or milestone and where it started from
- **Container home / off-grid**: What was built or solved and how it connects to the early retirement plan
- **DIY / fabrication**: What was made, what tools or techniques were used, and that the work was done solo
- **Travel**: Specific and vivid, tied to the goal of visiting 50 countries when relevant
