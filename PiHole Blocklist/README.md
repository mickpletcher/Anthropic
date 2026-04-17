# pihole-blocklist

A Claude skill for evaluating, categorizing, and documenting new Pi-hole blocklist sources. Complements the existing pihole-csv-analyzer skill by covering the curation side — deciding what goes into the blocklist rather than analyzing what it blocks.

---

## Overview

This skill activates when evaluating a new blocklist source, researching whether to add a URL, reviewing existing sources, or updating repo documentation. It applies a consistent evaluation framework and produces ready-to-commit documentation entries matching the existing repo format at github.com/mickpletcher/PiHole.

---

## Trigger

Context-based. Activates on:

- Pasting a raw blocklist URL for evaluation
- Phrases like "should I add this list", "evaluate this blocklist", "is this a good list", "add to pihole"
- Requests to review existing sources, check for overlap, or update the repo README
- Any mention of adding or removing a Pi-hole blocklist source

---

## Category Taxonomy

| Category | What It Covers |
|---|---|
| Advertising | Ad servers, ad networks, pop-up ad domains |
| Tracking | Telemetry, fingerprinting, analytics, CNAME cloaking |
| Malicious | Malware, ransomware, phishing, scam domains |
| Suspicious | Spam, referrer spam, high-risk domains |
| Fake DNS / DynDNS | Fake DNS providers, dynamic DNS abusers |
| Piracy | Anti-piracy DNS blocklists |
| Fake News | Known fake news domains |
| Stalkerware | Stalkerware and spyware indicator domains |
| Device Trackers | Platform-native trackers (Amazon, Apple, TikTok, Samsung, LG, Windows/Office) |
| Smart TV / IoT | Smart TV and IoT telemetry across all brands |
| URL Shorteners | URL shorteners used to obscure malicious links |
| Encrypted DNS / VPN Bypass | Domains used to circumvent DNS filtering |
| OISD | Comprehensive all-in-one lists |
| Whitelist | Approved domains excluded from blocking |

---

## Evaluation Output Format

```
SOURCE: [Name]
URL: [raw URL]
CATEGORY: [from taxonomy]
MAINTAINER: [GitHub user / org / project name]
LAST UPDATED: [date or "active"]
DOMAIN COUNT: [approximate]
FORMAT: [hosts / plain domain list / mixed]
OVERLAP RISK: [low / medium / high]
FALSE POSITIVE RISK: [low / medium / high]
RECOMMENDATION: [Add / Add with caution / Skip / Whitelist candidate]
NOTES: [caveats, known issues, context]
```

---

## Reference Files

| File | Contents |
|---|---|
| `references/sources.md` | Full index of all 57 curated sources organized by category |

---

## Related Skills

| Skill | Purpose |
|---|---|
| pihole-csv-analyzer | Analyzes Pi-hole query log CSV exports — what is being blocked and by which list |

---

## File Structure

```
pihole-blocklist/
├── README.md
├── SKILL.md
└── references/
    └── sources.md
```
