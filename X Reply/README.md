# x-reply

A Claude AI skill for writing replies to replies on X. Triggered by typing `xr` followed by the reply you want to respond to. Tone adjusts automatically based on whether the reply is supportive, a question, skeptical, or bad faith. Every response fits within 280 characters.

## Trigger

Start any message with `xr` to activate this skill. Paste the reply you are responding to after it. Include the original post for more accurate context, but it is not required.

```text
xr That leg press number is wild
```

```text
xr post: 790 lbs on leg press today. Started at 465 three months ago.
reply: What program are you following?
```

Output is the reply text ready to paste into X, with character count shown below it.

## What it does

Reads the reply, identifies the type, applies the right tone, generates a response within 280 characters, shows the character count, and asks if anything needs adjusting. No clarifying questions asked first. If the response runs over 280 characters it fixes it automatically.

## Reply Types and Tone

| Reply type | Tone | Approach |
| --- | --- | --- |
| Supportive or agreeing | Grounded, not gushing | Acknowledge briefly, extend the thought if space allows |
| Follow-up question | Direct and specific | Answer with real details, offer to go deeper if needed |
| Challenging or skeptical | Confident, not defensive | State your position with one specific fact and move on |
| Troll or bad faith | Calm and dismissive | 1 to 5 words, close the thread, do not engage the argument |

## Rules

- No emojis
- No hyphens or em dashes
- No quotation marks around words or phrases
- 280 characters maximum including any hashtags
- Hashtags only if they fit naturally — never forced
- Never start with "Great question!", "Thanks!", or any reflexive opener
- Character count shown after every reply in `[X / 280 characters]` format

## Examples

### Supportive reply

> "That leg press number is wild"

Response:

```text
Started at 465. Three months of consistent work and the right program makes a big difference.
```

`[93 / 280 characters]`

---

### Follow-up question

> "What PowerShell module are you using for that?"

Response:

```text
Custom module I built. Uses the Graph API for Intune data, outputs directly to a structured log. Happy to share the repo if useful.
```

`[131 / 280 characters]`

---

### Skeptical reply

> "PowerShell is dead, everything is moving to Python"

Response:

```text
Python is strong but PowerShell owns Windows endpoint management. Graph API, Intune, SCCM, Active Directory. It is not going anywhere in enterprise.
```

`[149 / 280 characters]`

---

### Troll reply

> "This is the dumbest thing I've ever read"

Response:

```text
Noted.
```

`[6 / 280 characters]`

## Banned Phrases

"journey", "transformative", "game-changer", "it means a lot", "appreciate the kind words", "happy to help", "great point", "totally agree", "leverage", "showcase", "utilize", "I understand where you are coming from"

## Related Skills

- [x-post](../X%20Post/README.md) — Write original X posts using the `xp` trigger
- [facebook-post](../Facebook%20Post/README.md) — Write Facebook posts using the `fbp` trigger
- [facebook-reply](../Facebook%20Reply/README.md) — Write Facebook comment replies using the `fbr` trigger
