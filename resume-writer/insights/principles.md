# Resume Writer Insights Library

Curated, attributed insights from recruiters, hiring managers, HR professionals, and other experienced hiring voices. Every principle here has a named source. For universal structural hygiene that applies regardless of source — section order, length, formatting, bullet structure, red flags — see `references/common-patterns.md`.

## Precedence rule

During an audit, a violation might map to both a library principle and a common pattern. When both apply, **cite the library principle**. Library principles carry a named source and specific framing, which makes the audit more credible to the reader. Patterns are the fallback.

## Format

Each principle follows this structure:

```text
## <Principle Name>

**Rule**: <1-2 sentence actionable rule>

**Rationale**: <Why it matters to the source>

**Example violation**: <Bad example, quoted or synthesized>

**Example fix**: <Good example>

**Sources**:
- <name>, <Title> — <Platform>, <Date>
```

If a principle is later strengthened by an additional source with a new angle, append the source line with an inline note:

```text
**Sources**:
- <name1>, <Title1> — <Platform>, <Date>
- <name2>, <Title2> — <Platform>, <Date> (adds: <the new angle>)
```

To add new principles, use the skill's "Add Insight" mode.

---

## Lead with project impact, not credentials

**Rule**: Do not open a resume with a stack of certifications. Open with the most impactful project or outcome you have delivered. Certifications belong further down the document.

**Rationale**: Hiring managers care about what you have done with your skills, not whether you passed a test. Certifications are a baseline filter, not a differentiator. Leading with them signals that credentials are your strongest asset, which is a weak opening.

**Example violation**: A ServiceNow architect resume that leads with "CSA Certified, CAD Certified, CIS-HR Certified" before any project history.

**Example fix**: Lead the resume with a headline bullet like "Migrated 200 catalog items in 6 weeks during Fortune 500 ServiceNow consolidation, retiring 4 legacy tools."

**Sources**:

- Brandon Wilson, CTA, MMIS, Founder of OnlyFlows and ServiceNow Practice Lead at Four Dragons — LinkedIn, April 2026

---

## Every bullet must name the thing

**Rule**: Generic bullets like "configured modules" or "improved processes" are worthless. Every bullet must name the specific module, system, process, or artifact involved.

**Rationale**: Vague bullets prevent the recruiter from evaluating the actual scope and technical depth of the work. If you configured ServiceNow modules, say which ones. If you improved a process, name the process. Without specifics, the bullet tells the reader nothing.

**Example violation**: "Configured ServiceNow modules to support business operations."

**Example fix**: "Configured ServiceNow ITSM, HR Service Delivery, and CSM modules, including custom workflows in HRSD for onboarding automation that replaced a 4-step manual process."

**Sources**:

- Brandon Wilson, CTA, MMIS, Founder of OnlyFlows and ServiceNow Practice Lead at Four Dragons — LinkedIn, April 2026

---

## Numbers, everywhere, or you get an interview with nobody

**Rule**: Every bullet that describes an outcome must quantify it. Dollars, percentages, time saved, volume handled, people managed, tickets resolved, latency reduced. No numbers means no impact.

**Rationale**: "Improved incident response" is unverifiable and unmemorable. "Reduced MTTR from 4.2 hours to 1.8 hours across 12,000 monthly incidents" is specific, testable, and immediately tells the hiring manager the scale of environment you worked in.

**Example violation**: "Improved incident response times and reduced ticket backlog."

**Example fix**: "Reduced MTTR from 4.2 hours to 1.8 hours across 12,000 monthly incidents, cutting ticket backlog from 1,800 to under 200 within 90 days."

**Sources**:

- Brandon Wilson, CTA, MMIS, Founder of OnlyFlows and ServiceNow Practice Lead at Four Dragons — LinkedIn, April 2026

---

## Two pages is the ceiling

**Rule**: Keep most resumes to two pages maximum. If content pushes past two pages, cut lower value bullets, collapse older roles, and keep only evidence that strengthens the case for the target role.

**Rationale**: Hiring teams scan quickly. Overlength resumes signal weak prioritization and bury the strongest evidence. Better curation usually beats more content.

**Example violation**: A three-page resume where older roles repeat generic responsibilities and duplicate skills already proven in recent roles.

**Example fix**: Collapse older experience into an "Earlier Experience" line, trim repetitive bullets, and keep the two pages focused on quantified outcomes relevant to the target role.

**Sources**:

- Brandon Wilson, CTA, MMIS, Founder of OnlyFlows and ServiceNow Practice Lead at Four Dragons — LinkedIn, April 2026

---

## A resume is a sales document, not a job history

**Rule**: A resume should persuade the reader to interview you. It is not a chronological list of every task you have ever performed. Every line must earn its place by making the case that you should be hired.

**Rationale**: Job histories bore recruiters. Sales documents compel them. This principle underlies every other principle in this library: why lead with impact, why quantify, why cut length. A resume that reads like a job description for your past roles has failed.

**Example violation**: "Responsible for managing incident response team and ensuring SLA compliance."

**Example fix**: "Led 7-person incident response team to 99.2% SLA compliance across 12,000 monthly tickets, up from 87% at start of tenure."

**Sources**:

- Brandon Wilson, CTA, MMIS, Founder of OnlyFlows and ServiceNow Practice Lead at Four Dragons — LinkedIn, April 2026

---

## Reverse chronological is default because it is easiest to trust

**Rule**: Use reverse chronological format by default, with recent experience first and clear date continuity.

**Rationale**: Hiring teams scan fast. Chronological flow reduces cognitive load and makes progression, recency, and relevance obvious in seconds.

**Example violation**: A resume that starts with broad skills categories and pushes dates and employers to page two.

**Example fix**: Start with recent role entries that show title, employer, and dates, then support each role with focused achievement bullets.

**Sources**:

- Alyse Maguire, Author, "How to Make the Perfect Resume: Your Step-by-Step Guide (with Examples!)" — The Muse, Updated 11/29/2024
- Angela Smith, Career Coach, quoted in The Muse guide above — The Muse, Updated 11/29/2024 (adds: caution that skills based formats can be hard to follow)

---

## The top third must declare the target role

**Rule**: The first screen of the resume should make target role fit obvious through headline, summary focus, and role relevant evidence.

**Rationale**: Recruiters decide quickly whether to keep reading. If role fit is buried, strong experience lower on the page may never be seen.

**Example violation**: A summary that says "experienced professional" with no domain, scope, or role alignment.

**Example fix**: A summary that states role focus, environment, and value: "Endpoint automation engineer focused on Intune and ConfigMgr operations for enterprise Windows fleets."

**Sources**:

- Heather Yurovsky, Career Coach, quoted in The Muse guide above — The Muse, Updated 11/29/2024

---

## Every bullet should answer what, why, and result

**Rule**: Structure bullets so they explain what you did, why it mattered, and what changed.

**Rationale**: Activity only bullets are weak evidence. Hiring managers want execution plus purpose plus outcome.

**Example violation**: "Managed incident queue and handled escalations."

**Example fix**: "Managed P1 and P2 incident queue for endpoint failures, introduced triage routing rules, and reduced average resolution time from 6.1 to 3.4 hours."

**Sources**:

- Martin McGovern, Career Coach, quoted in The Muse guide above — The Muse, Updated 11/29/2024

---

## Translate technical depth into readable language

**Rule**: Keep technical specificity, but write so a recruiter outside your specialty can still understand impact and scope.

**Rationale**: Many first readers are not deep practitioners in your stack. If bullets read like internal shorthand, your value gets lost before technical review.

**Example violation**: "Refactored DSC pipelines and normalized CIM sessions for endpoint posture drift."

**Example fix**: "Refactored PowerShell DSC deployment pipeline for endpoint posture checks, stabilizing policy enforcement across 4,000 devices and reducing repeat drift incidents."

**Sources**:

- Martin McGovern, Career Coach, quoted in The Muse guide above — The Muse, Updated 11/29/2024

---

## Tailor wording to the job description and ATS terms

**Rule**: Mirror role specific terminology from the target job description, but only for skills and experience you actually have.

**Rationale**: Tailoring improves both ATS matching and human relevance scanning. Generic resumes underperform against targeted ones.

**Example violation**: Resume uses only "device management" while the posting repeatedly requires "endpoint compliance" and "Intune policy remediation."

**Example fix**: Use proven terms from real experience: "Drove endpoint compliance remediation in Intune by automating policy drift detection and corrective scripts."

**Sources**:

- Alyse Maguire, Author, "How to Make the Perfect Resume: Your Step-by-Step Guide (with Examples!)" — The Muse, Updated 11/29/2024
- Heather Yurovsky, Career Coach, quoted in The Muse guide above — The Muse, Updated 11/29/2024 (adds: role match should be obvious to hiring managers)

---

## Skills section is a filter, not an inventory dump

**Rule**: Group skills by functional category and include only role relevant hard skills you can defend in interview.

**Rationale**: Recruiters scan skills for fast relevance checks and ATS alignment. Unstructured long lists create noise and reduce credibility.

**Example violation**: A single comma separated line of 40 tools with mixed relevance and no grouping.

**Example fix**: Group into concise categories such as Endpoint Management, Automation, Cloud Identity, and Reporting with only role relevant entries.

**Sources**:

- Alyse Maguire, Author, "How to Make the Perfect Resume: Your Step-by-Step Guide (with Examples!)" — The Muse, Updated 11/29/2024

---

## Career changers must make the bridge explicit

**Rule**: If shifting domains, make transferable skills explicit and anchor them to target role tasks in summary and top bullets.

**Rationale**: Hiring managers will not infer your transition logic for you. Bridge evidence must be visible, not implied.

**Example violation**: Candidate moving from operations to security keeps only old role language with no mapping to security outcomes.

**Example fix**: Summary and bullets explicitly connect prior work to target domain needs, such as risk reduction, access controls, incident handling, or policy execution.

**Sources**:

- Alyse Maguire, Author, "How to Make the Perfect Resume: Your Step-by-Step Guide (with Examples!)" — The Muse, Updated 11/29/2024

---

## Explain gaps directly and briefly

**Rule**: For meaningful breaks in employment, use a short factual line to explain the period rather than leaving unexplained silence.

**Rationale**: Unexplained gaps trigger speculation. Brief direct framing reduces friction and keeps focus on capability.

**Example violation**: Employment dates show a 14 month break with no context.

**Example fix**: Add one line such as "Career break (2023 to 2024): family caregiving and industry recertification."

**Sources**:

- Alyse Maguire, Author, "How to Make the Perfect Resume: Your Step-by-Step Guide (with Examples!)" — The Muse, Updated 11/29/2024

---

## Handle short tenure with grouped narrative, not defensive detail

**Rule**: When short roles appear repeatedly, group contract or transition work under clear labels and emphasize cumulative outcomes.

**Rationale**: Fragmented short tenure can look unstable without context. Grouped narrative preserves truth while reducing perceived volatility.

**Example violation**: Four consecutive 6 to 9 month roles each with one generic bullet and no context.

**Example fix**: Group as "Contract Infrastructure Roles" with consolidated bullets that show shared scope, stack, and measurable outcomes.

**Sources**:

- Alyse Maguire, Author, "How to Make the Perfect Resume: Your Step-by-Step Guide (with Examples!)" — The Muse, Updated 11/29/2024

---

## Senior resumes should show leadership scope before task detail

**Rule**: For senior candidates, lead bullets with ownership scope such as team span, budget, estate size, or program breadth before implementation detail.

**Rationale**: Senior hiring is about leverage, not only execution. Scope signals level quickly and frames technical work in organizational context.

**Example violation**: A director level resume with bullets that read like individual contributor ticket work only.

**Example fix**: "Directed endpoint modernization across 3 regions and 4,500 devices, then standardized policy automation that reduced exception backlog by 62%."

**Sources**:

- Brandon Wilson, CTA, MMIS, Founder of OnlyFlows and ServiceNow Practice Lead at Four Dragons — LinkedIn, April 2026

---

## Quantify outcomes when possible and qualify impact when numbers are missing

**Rule**: Use hard metrics when available. If exact numbers are unavailable, still state concrete observable impact and flag missing metrics for follow up.

**Rationale**: Strictly numeric framing is ideal but not always possible. Honest qualitative outcomes are better than vague claims or fabricated numbers.

**Example violation**: "Improved reliability and user experience across systems."

**Example fix**: "Stabilized endpoint patch compliance workflows, reducing repeat ticket escalations and shortening remediation cycles; exact volume metrics pending from reporting export."

**Sources**:

- Brandon Wilson, CTA, MMIS, Founder of OnlyFlows and ServiceNow Practice Lead at Four Dragons — LinkedIn, April 2026
- Martin McGovern, Career Coach, quoted in The Muse guide above — The Muse, Updated 11/29/2024 (adds: outcomes should still answer result)

---

## Early career candidates should lead with shipped work, not generic traits

**Rule**: Junior and early career resumes should prioritize projects, internships, labs, volunteer work, or campus leadership with concrete outputs.

**Rationale**: Early career candidates win by proving execution potential, not by listing personality adjectives.

**Example violation**: "Motivated self starter and quick learner looking for opportunity in tech."

**Example fix**: "Built and deployed a help desk triage dashboard during internship, reducing first response routing errors and documenting runbooks adopted by the team."

**Sources**:

- Alyse Maguire, Author, "How to Make the Perfect Resume: Your Step-by-Step Guide (with Examples!)" — The Muse, Updated 11/29/2024

---

## Objective statements should be replaced by value statements

**Rule**: Do not use objective statements that describe what the candidate wants. Use concise value statements that describe what the candidate delivers.

**Rationale**: Objectives consume top page real estate without proving capability. Value statements improve relevance and reader retention.

**Example violation**: "Seeking a challenging role where I can grow and use my skills."

**Example fix**: "Automation engineer improving endpoint compliance and release reliability through PowerShell and policy orchestration in enterprise Windows environments."

**Sources**:

- Heather Yurovsky, Career Coach, quoted in The Muse guide above — The Muse, Updated 11/29/2024

---
