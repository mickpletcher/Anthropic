---
name: pihole-csv-analyzer
description: Analyze CSV exports from Pi-hole (query logs, top domains/clients, blocklist hits) and produce actionable recommendations. Always trigger immediately when the user uploads or mentions a Pi-hole CSV file, types "pihole", "ph analyze", or asks to analyze DNS query data, blocklist hits, or Pi-hole exports. Also trigger when the user wants to find domains to block, whitelist, or audit their Pi-hole configuration. Produces both an in-chat analysis and downloadable blocklist/allowlist text files.
---

# Pi-hole CSV Analyzer

Analyzes Pi-hole CSV exports and produces:
- In-chat summary with actionable findings
- Downloadable `blocklist_candidates.txt` and `allowlist_candidates.txt` files

---

## Step 1 — Identify the CSV type

Read the file header row to detect which Pi-hole export type this is:

| Export Type | Typical Columns | How to Get It |
|---|---|---|
| **Query Log** | `time`, `type`, `domain`, `client`, `status`, `reply_type`, `reply_time`, `dnssec` | Pi-hole web UI → Query Log → Export |
| **Top Domains** | `domain`, `count` or `hits` | Pi-hole web UI → Dashboard → Top Permitted/Blocked |
| **Top Clients** | `client`, `count` or `hits` | Pi-hole web UI → Dashboard → Top Clients |
| **Blocklist/Adlist** | `address`, `enabled`, `comment`, `group`, `date_added` | Pi-hole Settings → Adlists export |

If the format is ambiguous, check the first 5 rows before proceeding. If still unclear, tell the user what was detected and ask them to confirm.

Pi-hole v6 exports may differ slightly — watch for JSON-wrapped CSVs or different column names (`query_type` instead of `type`, `client_name` vs `client`). Handle both gracefully.

---

## Step 2 — Parse and analyze with Python

Use `bash_tool` to run Python analysis. Always use `--break-system-packages` for pip installs.

```python
import pandas as pd
import re
from collections import Counter
from datetime import datetime

df = pd.read_csv('/mnt/user-data/uploads/<filename>')
```

### Analysis tasks by export type

#### Query Log Analysis
```python
# Normalize column names to lowercase
df.columns = df.columns.str.lower().str.strip()

# Status codes Pi-hole uses
BLOCKED_STATUSES = {2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 15, 16}
ALLOWED_STATUSES = {1, 8, 9, 14}

# If 'status' is numeric
if df['status'].dtype in ['int64', 'float64']:
    df['is_blocked'] = df['status'].isin(BLOCKED_STATUSES)
else:
    # String status fallback
    df['is_blocked'] = df['status'].str.contains('BLOCK|block', na=False)

total = len(df)
blocked = df['is_blocked'].sum()
allowed = total - blocked

# Top queried domains (allowed only)
top_allowed = df[~df['is_blocked']]['domain'].value_counts().head(20)

# Top blocked domains
top_blocked = df[df['is_blocked']]['domain'].value_counts().head(20)

# Top clients by query volume
top_clients = df['client'].value_counts().head(10)

# High-frequency clients (potential query hogs)
client_threshold = df['client'].value_counts().mean() * 3
hog_clients = df['client'].value_counts()[df['client'].value_counts() > client_threshold]

# Suspicious patterns
suspicious_patterns = [
    r'\d{1,3}-\d{1,3}-\d{1,3}-\d{1,3}',  # IP-in-domain
    r'\.tk$|\.cf$|\.gq$|\.ml$',            # Free TLD abuse
    r'[a-z0-9]{20,}\.',                     # Long random subdomains (DGA)
    r'(telemetry|tracking|analytics)\.',    # Telemetry
]
suspicious = df[~df['is_blocked']]['domain'].apply(
    lambda d: any(re.search(p, str(d)) for p in suspicious_patterns)
)
suspicious_domains = df[~df['is_blocked']][suspicious]['domain'].value_counts().head(20)
```

#### Top Domains/Clients Analysis
```python
df.columns = df.columns.str.lower().str.strip()
# Works for both top-permitted and top-blocked exports
# Sort by count descending, take top 50
top = df.sort_values(df.columns[-1], ascending=False).head(50)
```

#### Blocklist/Adlist Analysis
```python
df.columns = df.columns.str.lower().str.strip()
enabled_count = df['enabled'].sum() if 'enabled' in df.columns else 'N/A'
disabled = df[df['enabled'] == 0] if 'enabled' in df.columns else pd.DataFrame()
```

---

## Step 3 — Generate recommendations

### Blocklist candidates (domains to ADD to Pi-hole)
Flag allowed domains that match ANY of these criteria:
- Match suspicious pattern regexes above
- Contain: `telemetry`, `tracking`, `analytics`, `metric`, `beacon`, `pixel`, `stat.`, `stats.`, `collect.`, `data-collect`
- Free TLDs with no obvious legitimate use: `.tk`, `.cf`, `.gq`, `.ml`
- IP-address-style subdomains
- Extremely high query volume from a single client with no user-facing purpose

**Do not flag:**
- Major CDNs: `cloudflare.com`, `fastly.net`, `akamai.net`, `amazonaws.com`
- OS update domains: `windowsupdate.com`, `apple.com`, `ubuntu.com`
- Common legitimate services: Google, Microsoft, Apple, Cloudflare, GitHub

### Allowlist candidates (domains BLOCKED that probably shouldn't be)
Flag blocked domains that match ANY of these:
- Contain known legitimate service names (Office 365, iCloud, Windows Update, Netflix, Spotify, common banking domains)
- Are queried frequently (top 10 blocked) — high frequency blocked = likely breaking something
- Have `reply_type` of `NXDOMAIN` and appear to be legitimate TLDs

### Query hog clients
Flag clients where query count > 3x the client average. Note their IP and top domains queried.

---

## Step 4 — Output format

### In-chat summary (always produce this)

```
## Pi-hole Analysis — [filename] — [date range if available]

### Overview
- Total queries: X
- Blocked: X (X%)
- Allowed: X (X%)

### Top Allowed Domains
1. domain.com — X queries
...

### Top Blocked Domains
1. tracker.com — X queries
...

### Top Clients by Volume
1. 192.168.x.x — X queries
2. ...

### ⚠️ Query Hogs (>3x average)
- 192.168.x.x — X queries (Xх avg) — top domain: example.com

### 🚩 Suspicious Allowed Domains
Domains that are currently allowed but look like candidates to block:
- random23abc.example.tk — matches DGA pattern, 47 queries from 192.168.1.5

### ✅ Possible Allowlist Candidates
Domains currently blocked that may be breaking legitimate functionality:
- login.microsoftonline.com — 312 blocked queries (Microsoft auth)

### Recommendations
1. ...
2. ...
```

### Output files (always produce both)

Save to `/mnt/user-data/outputs/`:

**`blocklist_candidates.txt`**
```
# Pi-hole Blocklist Candidates
# Generated from: <filename>
# Date: <today>
# Add these to Pi-hole → Group Management → Domains → Blacklist
#
domain1.com
domain2.net
```

**`allowlist_candidates.txt`**
```
# Pi-hole Allowlist Candidates  
# Generated from: <filename>
# Date: <today>
# Review each entry — add confirmed ones to Pi-hole → Group Management → Domains → Whitelist
#
domain1.com  # Microsoft auth — likely blocking sign-in
domain2.com  # High query frequency — investigate
```

Then call `present_files` with both output files.

---

## Edge cases

- **Empty or malformed CSV**: Tell the user what's wrong and what format is expected
- **No blocked queries**: Skip blocked analysis, note that blocking may not be configured or the log period was short
- **No suspicious domains found**: Say so explicitly — don't invent recommendations
- **IPv6 clients**: Display as-is, don't attempt to resolve
- **Large files (>100k rows)**: Sample 50k rows for pattern analysis, note this in output
- **Pi-hole v6 JSON-wrapped CSV**: Strip the JSON envelope and parse the inner CSV

---

## Tone and style

- Be direct. Lead with the most actionable finding.
- Don't pad the output. If there's nothing suspicious, say "No suspicious patterns detected."
- Flag uncertainty clearly: "This domain *may* be tracking-related — verify before blocking."
- Never recommend blocking a domain you aren't reasonably confident about.