# Resume Writer

A Claude skill that rewrites resumes using a persistent library of principles harvested from real recruiters, hiring managers, and HR professionals.

## Overview

Resume Writer runs in two modes. Enhance Mode rewrites resumes and returns a condensed audit by default. Full forensic line by line audit is available on request. Add Insight Mode extracts principles from recruiter or hiring guidance and appends them to the local library for future rewrites.

The library is curated by the user, so the skill improves as you feed it high signal guidance over time.

## What This Does

Enhance Mode:

1. Detects the resume format and extracts text
2. Applies confidence levels based on source quality
3. Loads principles and common patterns
4. Produces a full rewrite plus a condensed audit by default
5. Adds Missing data and Gap Analysis sections
6. Provides full forensic audit only when explicitly requested

Add Insight Mode:

1. Accepts a pasted post, URL, or screenshot of a recruiter or HR post
2. Extracts one or more actionable principles
3. Checks for duplicates against existing library entries
4. Appends new principles to `insights/principles.md` with source attribution
5. Confirms what was added, merged, or skipped

## Why Trust This Skill

- Every rewrite recommendation is traceable to either a named principle in `insights/principles.md` or a cited entry in `references/common-patterns.md`.
- Factual resume details are preserved: employer names, job titles, dates, education, and certifications.
- Metrics are never fabricated. Missing metrics are flagged in Missing data.
- Low confidence extraction is labeled honestly for scans, screenshots, and heavy layouts.
- Weaknesses not covered by the current library are flagged as Not-in-library observations instead of fake attribution.

## Output Modes

- Condensed audit (default): grouped by section, highest value issues first.
- Full forensic audit (on request): line by line detail with Location, Source, Before, After.

Both modes include a rewritten resume, Missing data, and Gap Analysis.

## Confidence Levels

- High confidence: pasted text or clean DOCX.
- Medium confidence: machine readable PDF.
- Low confidence: screenshots, scans, or heavily formatted resumes.

If the source is not plain pasted text, extraction confidence and parsing limitations are stated in output.

## Mini Before and After Examples

1. Weak technical bullet to specific impact

Before:

```text
Worked on Azure automation and improved deployment process.
```

After:

```text
Built PowerShell automation for Azure resource validation and release gates, cutting failed deployments from 14% to 3% across quarterly releases.
```

1. Generic summary to targeted summary

Before:

```text
Experienced IT professional seeking a challenging position.
```

After:

```text
Endpoint automation engineer focused on Intune and ConfigMgr operations for large Windows fleets, with a track record of reducing compliance drift and manual remediation workload.
```

1. Skills dump to grouped role relevant skills

Before:

```text
PowerShell, SCCM, Intune, Azure, SQL, Python, Linux, VMware, networking, security, Windows, Office, SharePoint, ServiceNow
```

After:

```text
Endpoint Management: Intune, ConfigMgr (SCCM), Windows 11
Automation: PowerShell, Graph API, task sequence scripting
Cloud Identity: Azure AD, Conditional Access
Operational Reporting: SQL, compliance dashboards
```

## Gap Analysis Example

```text
Gap Analysis
- Missing keyword: endpoint compliance baseline
- Missing metric: percentage improvement in compliant devices after remediation automation
- Missing evidence: ownership of cross team rollout and stakeholder communication
```

## Evidence Coverage

What the skill can strengthen:

- Measurable outcomes
- Scope (users, devices, services, regions, team size)
- Named systems and tools
- Leadership and ownership signals
- Business impact framing

What the skill cannot invent:

- Numbers the user never supplied
- Certifications not earned
- Job titles not held
- Tools not actually used

## How to Judge a Good Rewrite

- Is the target role obvious within seconds?
- Are key bullets specific about what was built or changed?
- Are outcomes quantified where the source evidence supports it?
- Were weak verbs removed?
- Is the skills section grouped and role relevant?
- Is the rewrite still factually faithful to the original resume?

## Repository Structure

```text
resume-writer/
|-- SKILL.md                  # Skill definition, triggers, and workflows
|-- README.md                 # This file
|-- insights/
|   |-- principles.md         # Persistent library of recruiter principles
|-- references/
|   |-- common-patterns.md    # Universal structural patterns and red flags
```

## Triggers

- `rw` + resume: Enhance mode. Rewrites the provided resume and produces an audit.
- `rw add` + post: Add Insight mode. Extracts principles from a pasted post and adds them to the library.
- "rewrite my resume": Enhance mode natural language trigger.
- "review my resume": Enhance mode natural language trigger.
- "add to my library": Add Insight mode natural language trigger.

## Installation

1. Download the `resume-writer.skill` file
2. Copy to your Claude skills directory. On Windows this is typically:

    ```text
    C:\Users\<username>\OneDrive\Documents\Claude\Skills\
    ```

3. Unzip if your client does not handle `.skill` files directly
4. Restart Claude Desktop or refresh available skills in Claude.ai

## Usage

Enhance a resume:

```text
rw
[paste resume text, or upload .docx, .pdf, or screenshot]
[optional: target role or job description]
```

Add a principle from a recruiter post:

```text
rw add
[paste the post text, or upload a screenshot]
```

Enhance Mode output includes:

- A condensed audit by default that groups repeated issues by section
- A full forensic line by line audit only when explicitly requested
- The full rewritten resume
- A Missing data section listing metrics the user should supply
- A Gap Analysis section listing likely missing evidence, keywords, and metrics for the target role
- A Not-in-library observations section for weaknesses that need new principles added

Add Insight Mode output includes:

- A summary of which principles were added, merged with existing entries, or skipped as duplicates
- The exact text appended to `insights/principles.md`

## Growing the Library

The skill improves over time as new principles are added. Feed it recruiter posts, HR blog excerpts, and hiring manager commentary whenever you see high signal content. Recommended sources:

- LinkedIn posts from recruiters and hiring managers (screenshot and paste in)
- Ask a Manager blog posts
- Reddit r/recruiting and r/recruitinghell for pattern critiques
- Medium posts from career coaches
- HR and recruiting newsletters

The library file at `insights/principles.md` is plain Markdown, so you can also edit it directly or import entries from other sources. Each principle includes a name, rule, rationale, example violation, example fix, and source attribution.

## Principle Format

New entries follow this structure:

```markdown
## <Principle Name>

**Rule**: <1 to 2 sentence actionable rule>

**Rationale**: <Why it matters to the recruiter or hiring manager>

**Example violation**: <Bad example, quoted or synthesized>

**Example fix**: <Good example>

**Sources**:
- <Name>, <Title> — <Platform>, <Date>
```

## Seeded Principles

The initial library contains five principles from a single ServiceNow practice lead post:

1. Lead with project impact, not credentials
2. Every bullet must name the thing
3. Numbers, everywhere, or you get an interview with nobody
4. Two pages is the ceiling
5. A resume is a sales document, not a job history

These are starting points. The library is expected to grow to dozens of principles over time across different industries and role levels.

## Limitations

- Parsing quality depends on source quality.
- Multi column and table heavy resumes may lose structure during extraction.
- If extraction is severely scrambled or incomplete, the skill stops and asks for pasted text.
- If `insights/principles.md` or `references/common-patterns.md` cannot be read, the audit runs in degraded mode and explicitly states missing inputs.
- If the environment cannot write to `insights/principles.md`, Add Insight mode returns append ready text for manual update.

## License

This project is licensed under the MIT License. See `LICENSE` for the full text.
