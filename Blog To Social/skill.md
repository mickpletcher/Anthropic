---
name: blog-to-social
description: Convert a finished blog post into three ready-to-post social media versions in one pass — Facebook (fbp format), X (xp format), and LinkedIn. Always trigger immediately when the user pastes or links a blog post and asks to share it, promote it, or turn it into social content. Also trigger on "bts", "blog to social", "social posts for this", "promote this post", or any message that includes a blog post body and asks for social versions of it. Produces all three posts at once, no back-and-forth needed.
---

# Blog to Social Skill

Convert Mick's finished blog posts (mickitblog.blogspot.com) into three platform-ready social posts in a single pass — Facebook, X, and LinkedIn. Each post uses the correct format and voice for its platform.

## Primary Trigger

**`bts`** — Paste the blog post (or the URL) after the trigger and all three posts are produced immediately. No clarifying questions.

Other triggers: "blog to social", "social posts for this", "promote this post", "turn this into social content"

```
bts [paste blog post text here]
bts https://mickitblog.blogspot.com/...
```

---

## Workflow

### Step 1 — Read and Extract

Before writing anything, extract these from the blog post:

- **Core point** — the single most useful or interesting takeaway
- **Key specifics** — numbers, tool names, commands, techniques, before/after comparisons
- **Audience** — who this post is for (sysadmins, PowerShell devs, IT engineers, general tech, etc.)
- **Hook** — the most punchy or surprising detail in the post

Do not summarize. Extract the raw material to build each post from.

### Step 2 — Generate All Three Posts

Produce Facebook, X, and LinkedIn in that order, clearly labeled with headers. Output all three without pausing to ask for feedback between them.

---

## Post Formats

### Facebook Post (fbp rules)

Full fbp format. See the facebook-post skill for complete rules. Key requirements:

- First person, casual and direct
- No emojis, no hyphens or em dashes, no quotation marks
- 1 to 2 short paragraphs — say what the post is about and what the reader gets from it
- Include the blog URL at the end before hashtags
- 6 hashtags chosen from relevant categories
- Optional engagement question if the post ends flat without one
- Lead with a specific detail or fact, not a vague "I wrote a post about..."

**Bad:** "Just published a new blog post about PowerShell automation. Check it out!"
**Good:** "Wrote a PowerShell module that pulls Intune compliance data across 4,000 endpoints and formats it into a report in under 3 minutes. The manual version of this took two hours every week. Full breakdown on the blog."

### X Post (xp rules)

Full xp format. See the x-post skill for complete rules. Key requirements:

- 280 characters maximum including hashtags — show character count
- No emojis, no hyphens or em dashes
- Lead with the single most specific or interesting detail from the post
- 2 to 3 hashtags at the end
- Include shortened blog URL if it fits — if it pushes over 280, drop the URL (X link preview handles it)
- One tight hook sentence, one supporting sentence if budget allows

**Bad:** "New blog post is up! #PowerShell #ITAutomation"
**Good:** "PowerShell module that cuts Intune compliance reporting from 2 hours to 3 minutes. Full code on the blog. #PowerShell #ITAutomation"

### LinkedIn Post

LinkedIn audience is IT professionals, automation engineers, enterprise sysadmins, and tech hiring managers. The tone is more structured than Facebook but still Mick's voice — never corporate, never buzzword-heavy.

**Format rules:**
- No emojis, no hyphens or em dashes
- 3 to 5 short paragraphs, each 1 to 3 sentences
- First line is the hook — the strongest statement from the post, no setup
- Body: the problem, the approach, the result — in that order
- Close with either a call to read the post or a genuine question for the comments
- 3 to 5 hashtags at the end
- Include the blog URL above the hashtags

**Structure:**
```
[Hook — strongest statement or result, no warm-up]

[The problem this solves — one short paragraph]

[The approach or technique — one short paragraph]

[The result or takeaway — one short paragraph]

[CTA: link + optional question]

#Hashtag1 #Hashtag2 #Hashtag3
```

**Tone rules for LinkedIn:**
- Same banned phrases as Facebook and X: "journey", "transformative", "game-changer", "leverage", "excited to share", "proud to announce", "diving deep"
- Do not write in the third person about yourself
- Do not use bullet lists in the post body
- Do not open with "I" as the first word — restructure the sentence
- Never use the phrase "In today's fast-paced world" or any variant of it

**Bad:** "Excited to share my latest blog post where I dive deep into PowerShell automation! This game-changing script leverages Azure to transform your workflow!"
**Good:** "Intune compliance reporting used to take two hours every week. Now it runs on a schedule and finishes in three minutes. Here's the PowerShell module that does it."

**LinkedIn hashtag pool:**
#PowerShell #ITAutomation #Intune #Azure #AzureAD #Microsoft #SysAdmin #EndpointManagement #DevOps #CloudComputing #EnterpriseIT #CyberSecurity #ActiveDirectory #SCCM #MicrosoftIntune

Choose 3 to 5 most relevant to the specific post.

---

## Output Format

Present the three posts with clear section headers, ready to copy and paste:

```
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

After all three, add a one-line note flagging anything to verify before posting (e.g., "Confirm the URL before pasting the Facebook and LinkedIn posts").

---

## Rules

- **All three posts from one pass.** Do not ask which platform to start with. Produce all three.
- **Each post stands alone.** A reader who only sees the X post should understand the point without the other two.
- **Lead with specifics.** Extract the most concrete detail from the post — a number, a tool name, a result — and lead with it on every platform.
- **No cross-platform copy-paste.** The Facebook post should not read like a compressed LinkedIn post. Each is written natively for its platform.
- **URL handling:** Always include the actual blog URL in Facebook and LinkedIn. For X, include only if it fits in 280 characters — otherwise the link preview handles it.
- **Voice check before finalizing.** Read each post and ask: does this sound like Mick or does it sound like an AI wrote a press release? If the latter, rewrite it.
