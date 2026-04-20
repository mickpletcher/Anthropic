# Resume Writer

A Claude skill that rewrites resumes using a persistent library of principles harvested from real recruiters, hiring managers, and HR professionals.

## Overview

Resume Writer operates in two modes. Enhance Mode takes a resume in any common format (paste, .docx, .pdf, or screenshot) and produces a full rewrite plus an itemized audit that maps every change to a specific library principle. Add Insight Mode takes a recruiter post or HR blog excerpt, extracts the principle, and appends it to the local insights library for use on every future rewrite.

The library is curated by the user, so the skill improves as you feed it more high signal posts. The skill ships seeded with five principles extracted from a Brandon Wilson LinkedIn post (ServiceNow Practice Lead at Four Dragons) plus a set of universal structural patterns that apply regardless of library content.

## What This Does

Enhance Mode workflow:

1. Detects the resume format and extracts text
2. Loads every principle from the insights library
3. Audits every bullet, section, and structural choice against the library
4. Produces a full rewrite and a condensed audit by default, with full forensic detail only when requested
5. Flags any missing metrics the user should supply for a stronger rewrite

Add Insight Mode workflow:

1. Accepts a pasted post, URL, or screenshot of a recruiter or HR post
2. Extracts one or more actionable principles
3. Checks for duplicates against existing library entries
4. Appends new principles to `insights/principles.md` with source attribution
5. Confirms what was added, merged, or skipped

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
- A Missing Data section listing metrics the user should supply
- A Gap Analysis section listing likely missing evidence, keywords, and metrics for the target role
- A Not in Library Observations section for weaknesses that need new principles added

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
- If extraction is severely scrambled or incomplete, the skill should stop and ask for pasted text.
- If `insights/principles.md` or `references/common-patterns.md` cannot be read, the audit runs in degraded mode and should clearly state what is missing.

## Confidence Levels

- High confidence: pasted text or clean DOCX.
- Medium confidence: machine readable PDF.
- Low confidence: screenshots, scans, or heavily formatted resumes.

When the source is not pasted text, the output should state extraction confidence and any parsing limitations.

## Targeted Rewrite Support

When both a resume and job description or target role are present, the skill performs a targeted rewrite.

- Reorders summary, skills, and bullet emphasis to match the target role.
- Prioritizes target alignment over generic cleanup.
- Produces a Gap Analysis section with missing evidence, missing keywords, and missing metrics.
- Never fabricates experience, metrics, or unsupported keywords.

## Condensed vs Full Audit

- Condensed audit is the default.
- Full forensic audit is only for explicit line by line requests.

Condensed audit keeps output readable by grouping repeated issues and focusing on high value changes. Full forensic audit keeps per change detail with Location, Source, Before, and After.

## Manual Recovery for Add Insight Mode

If the environment cannot write to `insights/principles.md`, the skill should not claim the library was updated.

Instead, return the exact principle block that should be appended manually and clearly state manual update is required.

## Example Outputs

Example condensed audit headings:

```text
Condensed Audit
Section: Summary
Section: Experience
Section: Skills
Missing Data
Gap Analysis
Not-in-library observations
```

Example missing data section:

```text
Missing Data
- Experience / Role 1 / Bullet 2: Add scale metric (for example number of users, devices, or tickets).
- Experience / Role 2 / Bullet 1: Add outcome metric (for example percentage reduction or time saved).
```

Example gap analysis section:

```text
Gap Analysis
- Missing evidence: leadership scope for cross functional projects.
- Missing keywords: incident management, change enablement, service level reporting.
- Missing metrics: team size, ticket volume, MTTR baseline and improvement.
```

## Related Repositories

- [mickpletcher/Anthropic](https://github.com/mickpletcher/Anthropic): Claude skills library where this skill can live alongside others.

## Blog

Technical posts about Claude skills, automation, and workflow tooling at [mickitblog.blogspot.com](https://mickitblog.blogspot.com).

## License

This project is licensed under the MIT License. See `LICENSE` for the full text.
