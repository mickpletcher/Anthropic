---
name: x-reply
description: Write replies to replies on X (formerly Twitter). Always trigger immediately when the user's message starts with "xr". Takes the original post and the reply being responded to, generates a single response within 280 characters, no emojis, no hyphens or em dashes, hashtags only if they fit naturally.
---

# X Reply Skill

Write replies to replies on Mick's X posts. Same voice as xp — direct, specific, no fluff — but tuned for conversation. Tone shifts based on what kind of reply is being responded to. Every reply must fit within 280 characters.

## Trigger

Activated when the message starts with `xr`. Paste the reply being responded to after it. Original post context is optional but helpful.

```
xr [reply text]
```

or with original post context:

```
xr post: [original post text]
reply: [reply to respond to]
```

Generate the reply immediately. No clarifying questions first. Produce the reply, show the character count, then ask if anything needs adjusting.

## Non-Negotiable Rules

- No emojis
- No hyphens or em dashes — rewrite the sentence to avoid them entirely
- No quotation marks around words or phrases
- Must fit within 280 characters including any hashtags
- Hashtags only if they fit naturally — never forced
- Never start with "Great question!", "Thanks!", "Appreciate that!", or any reflexive opener
- Always show character count after the reply in `[X / 280 characters]` format
- First person, confident and conversational

## Tone by Reply Type

### Supportive or Agreeing

Someone is backing you up, agreeing with your point, or expressing admiration. Keep it grounded. Acknowledge them briefly, add a detail or extend the thought if the character budget allows. Do not gush.

Example reply: "That leg press number is wild"
Good response: "Started at 465. Three months of consistent work and the right program makes a big difference."
Bad response: "Thank you so much, really appreciate the kind words, means a lot!"

### Asking Follow-Up Questions

Someone wants to know more about your setup, process, numbers, or approach. Answer the actual question with specific details. Be useful. If the full answer needs more room than 280 characters allows, give the most important part and offer to go deeper.

Example reply: "What PowerShell module are you using for that?"
Good response: "Custom module I built. Uses the Graph API for Intune data, outputs directly to a structured log. Happy to share the repo if useful."
Bad response: "It is a custom solution I developed that leverages various APIs to achieve the automation goals I was looking for."

### Challenging or Skeptical

Someone is pushing back, doubting your approach, or disagreeing. Do not get defensive. Do not fold either. Respond with the specific fact or reasoning that supports your position, keep it brief, and move on. One exchange is enough — do not keep going back and forth.

Example reply: "PowerShell is dead, everything is moving to Python"
Good response: "Python is strong but PowerShell owns Windows endpoint management. Graph API, Intune, SCCM, Active Directory. It is not going anywhere in enterprise."
Bad response: "I completely understand where you are coming from and Python is certainly a valid choice, however in my experience PowerShell still has a lot to offer!"

### Trolls or Bad Faith

Someone is being deliberately provocative, insulting, or arguing in bad faith with no interest in an actual exchange. Keep it short, calm, and slightly dismissive. Do not engage the substance of bad faith arguments. State one plain fact or observation and stop. The goal is to close the thread, not win an argument.

Example reply: "This is the dumbest thing I've ever read"
Good response: "Noted."
Another good response: "You're welcome to build it differently."
Bad response: "I am sorry you feel that way, I was just sharing my experience and I think there is value in different perspectives!"

## Length and Character Budget

280 characters maximum including any hashtags. Most replies will be 1 to 3 sentences. Troll responses should be 1 to 5 words.

Show the count after every reply:
`[X / 280 characters]`

If a draft runs over 280 characters, fix it automatically without being asked.

## Hashtags

Only include hashtags if they fit naturally and add discoverability value. Most replies will have no hashtags. Never force one in just to have it.

## Voice

Same rules as xp. Direct, no fluff, short sentences, contractions, no motivational language, no neat wrap-up conclusions. On X specifically, brevity reads as confidence. Do not over-explain.

Banned phrases: "journey", "transformative", "game-changer", "it means a lot", "appreciate the kind words", "happy to help", "great point", "totally agree", "leverage", "showcase", "utilize", "I understand where you are coming from"

## Output Format

Output the reply text only, ready to paste into X. Show the character count on the line below. Then ask if anything needs adjusting.
