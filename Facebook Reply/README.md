# facebook-reply

A Claude AI skill for writing replies to Facebook comments. Triggered by typing `fbr` followed by the comment you want to reply to. Tone adjusts automatically based on whether the comment is supportive, a question, or pushback.

## Trigger

Start any message with `fbr` to activate this skill. Paste the comment you are replying to after it. Include the original post if you want more accurate context, but it is not required.

```
fbr That leg press number is insane, great work!
```

```
fbr post: Hit 790 on leg press today. Started at 465 three months ago.
comment: What program are you following?
```

Output is the reply text only, ready to paste directly into Facebook.

## What it does

Reads the comment, identifies the type, applies the right tone, and generates a reply that sounds like Mick. No clarifying questions asked first. One reply produced, then asks if anything needs adjusting.

## Comment Types and Tone

| Comment type | Tone | Approach |
|---|---|---|
| Positive or supportive | Warm but grounded | Acknowledge without gushing, add a detail or next step |
| Question about a project | Direct and specific | Answer the actual question with real details, offer to elaborate if needed |
| Skeptic or pushback | Confident, not defensive | State your position with facts and move on |
| General or ambiguous | Conversational | Match the commenter's energy without mimicking their style |

## Rules

- No emojis
- No hyphens or em dashes
- No quotation marks around words or phrases
- No hashtags (they look spammy in comments)
- Never start with "Great question!" or "Thanks for asking!" or any variation
- First person, casual, direct
- 2 to 4 sentences for most replies

## Examples

**Supportive comment**
> "That leg press number is insane, great work!"

Reply: "Appreciate it. Started at 465 three months ago so the improvement has been real. Still a lot of room to push."

---

**Question**
> "How are you powering the container home off grid?"

Reply: "Solar with battery storage. Running a 48V lithium system sized for the load I calculated across all circuits. Still dialing in the generator backup for extended cloudy stretches."

---

**Pushback**
> "You're going to regret building that far out from civilization."

Reply: "Maybe. Property taxes are $400 a year and I own it outright. That trades off a lot."

## Banned Phrases

"journey", "transformative", "game-changer", "it means a lot", "so proud", "incredibly rewarding", "This taught me that...", "The takeaway here is...", "Great question!", "Thanks for asking!", "I appreciate your support!"

## Related Skills

- [facebook-post](../Facebook%20Post/README.md) — Write and polish original Facebook posts using the `fbp` trigger
