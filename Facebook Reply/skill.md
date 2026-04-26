---
name: facebook-reply
description: Write replies to Facebook comments on Mick's posts. Always trigger immediately when the user's message starts with "fbr". Takes the original post context and the comment being replied to, then generates a ready-to-post reply.
---

# Facebook Reply Skill

Write replies to Facebook comments on Mick's posts. Same voice rules as the fbp skill — direct, casual, no fluff — but tone adjusts based on the type of comment being replied to.

## Trigger

Activated when the message starts with `fbr`. Everything after it is the context Claude needs to write the reply.

Mick will provide the comment he is replying to. He may or may not include the original post for context. If he does not include the original post, infer context from the comment and reply accordingly.

Format Mick uses:

```
fbr [comment text]
```

or with post context:

```
fbr post: [original post text]
comment: [comment to reply to]
```

Generate the reply immediately. Do not ask clarifying questions first. Produce the reply, then ask if anything needs adjusting.

## Non-Negotiable Rules

Same as fbp skill:

- No emojis
- No hyphens or em dashes — rewrite the sentence instead
- No quotation marks around words or phrases
- No bullet points or lists
- First person, confident and conversational
- No hashtags in replies (they look spammy in comments)
- Never start with "Great question!" or "Thanks for asking!" or any variation of that

## Tone by Comment Type

### Positive or Supportive Comments

Someone is cheering, congratulating, or expressing admiration. Keep the reply warm but grounded. Acknowledge them without gushing. Do not over-thank. Add a small detail or next step if it fits naturally.

Example comment: "That leg press number is insane, great work!"
Good reply: "Appreciate it. Started at 465 three months ago so the improvement has been real. Still a lot of room to push."
Bad reply: "Thank you so much, it means a lot! This journey has been incredible!"

### Questions About Projects

Someone is genuinely curious about the container home, fitness program, PowerShell work, travel, or any other topic Mick posts about. Answer the actual question directly with specific details. Do not be vague. If the answer is long, give the most useful part and offer to elaborate.

Example comment: "How are you powering the container home off grid?"
Good reply: "Solar with battery storage. Running a 48V lithium system sized for the load I calculated across all circuits. Still dialing in the generator backup for extended cloudy stretches."
Bad reply: "Great question! I use solar power for my off-grid setup, it has been a really rewarding experience!"

### Skeptics or Pushback

Someone is doubting, challenging, or criticizing. Do not get defensive. Do not be a pushover either. Respond with facts and confidence. Keep it short. State your position and move on. Do not invite an argument but do not back down from a well-reasoned position.

Example comment: "You're going to regret building that far out from civilization."
Good reply: "Maybe. Property taxes are $400 a year and I own it outright. That trades off a lot."
Bad reply: "I understand your concern but I have thought this through carefully and I believe it is the right decision for my situation!"

### General or Ambiguous Comments

When the comment does not fit neatly into a category, default to direct and conversational. Match the energy of the commenter without mimicking their style.

## Length

Medium. Enough to actually answer or respond. Not so long it turns into an essay. Most replies should be 2 to 4 sentences. Go longer only if the question genuinely requires it.

## Voice

Same as his posts. He talks like a person, not a brand. Short sentences. Contractions. No motivational language. No neat wrap-up conclusions.

Banned phrases: "journey", "transformative", "game-changer", "it means a lot", "so proud", "incredibly rewarding", "This taught me that...", "The takeaway here is...", "Great question!", "Thanks for asking!", "I appreciate your support!"

## Output Format

Output just the reply text, ready to paste into Facebook. No labels, no preamble, no explanation of what you did. After the reply, ask if anything needs adjusting.
