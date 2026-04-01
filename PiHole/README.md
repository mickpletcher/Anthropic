# Pi-hole CSV Analyzer

This skill analyzes Pi-hole CSV exports and returns practical cleanup actions.

It produces:
* A concise in chat analysis
* A candidate blocklist file
* A candidate allowlist file

## Skill File

Primary skill definition:
* `pihole-csv-analyzer.md`

Packaging script in this folder expects `skill.md`.

## Trigger Conditions

The skill should trigger when the user:
* Uploads or mentions a Pi-hole CSV file
* Types `pihole` or `ph analyze`
* Asks to analyze DNS query data
* Asks to review blocklist hits
* Asks to find domains to block or whitelist

## Supported Export Types

The analyzer detects export type from the CSV header.

1. Query Log
2. Top Domains
3. Top Clients
4. Blocklist or Adlist exports

If format detection is unclear, it checks early rows and asks for confirmation.

## What The Skill Analyzes

For query logs, it computes:
* Total query volume
* Allowed vs blocked rate
* Top allowed domains
* Top blocked domains
* Top clients by query volume
* Query hog clients with outsized traffic
* Suspicious allowed domains based on pattern matching

For top domains and top clients, it normalizes columns and ranks by count.

For blocklist and adlist exports, it summarizes enabled and disabled list state.

## Detection Logic Highlights

Blocklist candidates are generated from allowed domains that look suspicious.

The logic looks for:
* Tracking and telemetry style domain patterns
* Free TLD abuse indicators such as `.tk`, `.cf`, `.gq`, `.ml`
* IP like subdomain patterns
* Very high volume domains tied to a single client

The analyzer avoids recommending common critical services and major infrastructure domains where possible.

Allowlist candidates are generated from blocked domains that look likely to be legitimate and high impact.

## Pi-hole Query Status Codes

Use this reference when reading Query Log exports that include a numeric `status` column.

Most common values you called out:

1. `1` means Blocked by gravity
2. `3` means Allowed and replied from cache
3. `17` means Allowed and replied from stale cache

Important point:

If you are seeing many `1` rows, those queries were blocked.
If you are seeing many `3` or `17` rows, those queries were allowed.

Common blocked status codes in Pi-hole query exports:

1. `1` Blocked by gravity
2. `4` Blocked by regex denylist
3. `5` Blocked by exact denylist
4. `6` Blocked by upstream known blocking IP
5. `7` Blocked by upstream null address response
6. `8` Blocked by upstream NXDOMAIN condition
7. `9` Blocked by gravity during deep CNAME inspection
8. `10` Blocked by regex during deep CNAME inspection
9. `11` Blocked by exact denylist during deep CNAME inspection
10. `15` Blocked while database busy
11. `16` Blocked special domains
12. `18` Blocked by upstream EDE 15

Common allowed status codes in Pi-hole query exports:

1. `2` Allowed and forwarded
2. `3` Allowed from cache
3. `12` Allowed retried query
4. `13` Allowed retried ignored query
5. `14` Allowed already forwarded
6. `17` Allowed from stale cache

Version note:

Status codes can expand over time with new Pi-hole releases. When in doubt, confirm against your local Pi-hole API docs page at `http://pi.hole/api/docs` and the query database status table.

## Output Files

The skill always creates both files:
* `blocklist_candidates.txt`
* `allowlist_candidates.txt`

Expected destination:
* `/mnt/user-data/outputs/`

## In Chat Output

The skill returns a structured summary with:
* Overview metrics
* Top allowed and blocked domains
* Top clients
* Query hog callouts
* Suspicious allowed domains
* Possible allowlist candidates
* Actionable recommendations

## Edge Case Handling

The skill handles:
* Empty or malformed CSV files
* Exports with no blocked queries
* No suspicious domain scenarios
* IPv6 clients
* Large files by sampling pattern analysis
* Pi-hole v6 column naming differences

## Typical Workflow

1. Export a CSV from Pi-hole
2. Provide the CSV to the skill
3. Review the in chat findings
4. Review generated allow and block candidates
5. Apply only validated entries in Pi-hole

## Tutorial

This walkthrough shows a full analysis run from export to safe list updates.

### Step 1. Export data from Pi-hole

Pick one export to start.

1. Query Log export from Pi-hole web UI
2. Top Domains export from dashboard
3. Top Clients export from dashboard

If you are new to this skill, start with Query Log because it gives the most context.

### Step 2. Send the file with a clear request

Use one of these prompts when you provide the CSV.

```text
Analyze this Pi-hole CSV and tell me what should be blocked or allowlisted.
```

```text
pihole
```

```text
ph analyze
```

### Step 3. Read the summary first

Focus on these sections in order.

1. Overview for total volume and block rate
2. Top blocked domains for quick breakage clues
3. Query hog clients for noisy devices
4. Suspicious allowed domains for new block candidates
5. Possible allowlist candidates for legit services that were blocked

### Step 4. Review generated files

The skill creates two files.

1. blocklist_candidates.txt
2. allowlist_candidates.txt

Treat both files as review queues, not final policy.

### Step 5. Validate before applying

Check each candidate domain with simple rules.

1. If it is auth, update, or core CDN traffic, do not block without testing.
2. If it appears suspicious and has repeated volume, keep it as a block candidate.
3. If a blocked domain is tied to sign in or app startup failures, move it to allowlist candidates.

### Step 6. Apply in Pi-hole

After validation:

1. Add approved block entries to Group Management then Domains then Blacklist
2. Add approved allow entries to Group Management then Domains then Whitelist
3. Re test affected apps and devices

### Step 7. Re run after 24 to 48 hours

Export fresh data and run analysis again.

You should see:

1. Lower repeat noise from known bad domains
2. Fewer blocked requests for legitimate services
3. Clearer visibility into truly suspicious traffic

### Quick troubleshooting

If output looks wrong, check these first.

1. CSV header matches a supported export type
2. File is not empty or malformed
3. You exported enough time range to show real patterns
4. Query Log includes client and domain columns

## Example Run

Use this as a reference for what a good analysis cycle looks like.

### Example input

File name:
* `query-log-7days.csv`

Detected type:
* Query Log

Rows:
* 184320

### Example prompt

```text
Analyze this Pi-hole CSV and recommend blocklist and allowlist candidates.
```

### Example summary interpretation

Suppose the skill returns:

1. Total queries 184320
2. Blocked 41210 which is 22.4 percent
3. Top blocked domain is a telemetry endpoint
4. One client has 4.8 times average query volume
5. Two blocked domains map to Microsoft sign in flows

How to interpret that:

1. Block rate near 20 to 30 percent can be normal in ad heavy environments
2. Repeated telemetry domains with high volume are strong blocklist candidates
3. A client above 3 times average should be checked for app loops or misconfigured DNS behavior
4. High frequency blocked auth domains often indicate user impact and belong in allowlist review

### Example output files and actions

Example `blocklist_candidates.txt` entries:

```text
metrics.example-telemetry.net
stats.example-tracker.com
pixel.example-ads.tk
```

Example `allowlist_candidates.txt` entries:

```text
login.microsoftonline.com
device.login.live.com
```

Safe apply sequence:

1. Add only 3 to 5 new blocklist entries at a time
2. Test core workflows such as login, updates, and streaming
3. Add allowlist entries for confirmed false positives
4. Re run analysis after one day

### What good looks like after re run

1. Query hog volume drops for noisy clients
2. New suspicious allowed domains are fewer
3. Fewer blocked queries for known legitimate services
4. Overall browsing and app sign in success stays stable

## Example Run Top Domains Export

Use this when you only have dashboard exports and not full query logs.

### Example input

File name:
* `top-domains-24h.csv`

Detected type:
* Top Domains

Rows:
* 100

### Example prompt

```text
Analyze this Top Domains Pi-hole export and suggest likely blocklist candidates.
```

### Example findings

Suppose the skill returns:

1. Top 10 domains account for 62 percent of total domain hits
2. Three telemetry style domains appear in top 20
3. One suspicious free TLD domain appears with repeated hits
4. Several major CDN domains are present and correctly ignored for block suggestions

How to interpret that:

1. Concentrated traffic means a small number of changes can reduce most noise
2. Repeated telemetry domains are good first review targets
3. Free TLD plus repeated hits is a stronger candidate than one off appearances
4. CDN and platform domains should stay out of bulk block actions unless breakage testing is complete

### Suggested action flow

1. Shortlist up to 5 suspicious domains from the report
2. Add only 2 to 3 at first to reduce blast radius
3. Test browsing, media, and sign in on key devices
4. Add remaining approved entries
5. Export again next day and compare top domain mix

## Example Run Top Clients Export

Use this when you want to find noisy devices fast.

### Example input

File name:
* `top-clients-24h.csv`

Detected type:
* Top Clients

Rows:
* 25

### Example prompt

```text
Analyze this Top Clients Pi-hole export and identify query hog devices I should inspect.
```

### Example findings

Suppose the skill returns:

1. One client generates 38 percent of all client side queries
2. Two IoT clients each generate more than 3 times client average
3. Peak activity is concentrated during overnight hours
4. Most heavy traffic maps to telemetry style domains

How to interpret that:

1. A single client near 40 percent share is usually the first device to inspect
2. More than 3 times average suggests background retry loops or noisy firmware telemetry
3. Overnight spikes usually point to scheduled jobs, retries, or misconfigured apps
4. Telemetry dominant patterns can often be reduced with targeted domain blocks after testing

### Suggested action flow

1. Map each top client IP to hostname or device owner
2. Check device update state and DNS settings
3. Review top domains for each noisy client
4. Add carefully tested block candidates tied to repetitive telemetry
5. Re export Top Clients next day and confirm volume reduction

## Safety Notes

Recommendations are candidates, not automatic policy.

Validate domains before blocking:
* Blocking legitimate auth and update endpoints can break devices and apps
* High frequency alone is not proof of malicious behavior

## Maintenance

If you rename the skill definition file, update `PackSkill.ps1` expectations so packaging still finds the correct markdown file.
